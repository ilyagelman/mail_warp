# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mail_warp/version'

Gem::Specification.new do |spec|
  spec.name          = "mail_warp"
  spec.version       = MailWarp::VERSION
  spec.authors       = ["Ilya Gelman"]
  spec.email         = ["ilyagelman@ilyagelman.ru"]
  spec.description   = %q{Intercept emails and send them to MailWarp service.}
  spec.summary       = %q{TODO: Write a gem summary}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
