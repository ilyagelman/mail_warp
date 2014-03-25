module MailWarp
  class << self
    attr_accessor :config
  end

  def self.configure
    self.config ||= Configuration.new
    yield(config)
    ActionMailer::Base.register_interceptor(MailWarp)
  end

  class Configuration
    attr_accessor :email, :token, :enabled, :block_delivery

    def initialize
      @email = nil
      @token = nil
      @enabled = true
      @block_delivery = false
    end
  end
end