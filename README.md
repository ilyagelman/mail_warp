# MailWarp

Simple gem to intercept email and send them to MailWarp service.

## Installation

Add this line to your application's Gemfile:

    gem 'mail_warp', git: 'https://github.com/ilyagelman/mail_warp.git'

And then execute:

    $ bundle

Then add this configuration to your application or environment config file:

    MailWarp.configure do |config|
      config.enabled = true        # enable mail interception
      config.block_delivery = true # don't proceed sending email
      config.token = 'token-for-your-application'
      config.email = 'your-user-email-on-mailwarp-service'
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
