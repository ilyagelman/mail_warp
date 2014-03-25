require "net/http"
require "uri"
require "mail_warp/version"
require "mail_warp/config"

module MailCatcher
  def self.delivering_email(message)
    params = { email:       self.config.email,
               token:       self.config.token,
               from:        message.from,
               to:          message.to,
               cc:          message.cc,
               bcc:         message.bcc,
               subject:     message.subject }

    if message.multipart?
      params[:text_part] = message.text_part.body.raw_source
      params[:html_part] = message.html_part.body.raw_source
    else
      params[:text_part] = message.body.raw_source
    end

    attachments = message.attachments.map do |a|
      { content_type: a.content_type,
        filename:     a.filename,
        raw_source:   a.body.raw_source }
    end
    params[:attachments] = Marshal::dump(attachments)

    intercept_letter if self.config.enabled
    block_delivery if self.config.block_delivery

  end

  def intercept_letter
    Rails.logger.debug "MailWarp intercepting mail #{message.inspect}"
    Net::HTTP.post_form(URI.parse('http://mail-catcher-service.herokuapp.com/letters/create'), params)
  end

  def block_delivery
    message.perform_deliveries = false
    Rails.logger.debug "MailWarp prevented sending mail #{message.inspect}!"
  end
end