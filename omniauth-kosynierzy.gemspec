# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth/kosynierzy/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-kosynierzy"
  spec.version       = OmniAuth::Kosynierzy::VERSION
  spec.authors       = ["Jan Dudulski"]
  spec.email         = ["jan@dudulski.pl"]
  spec.description   = %q{OmniAuth strategy for Kosynierzy}
  spec.summary       = %q{OmniAuth strategy for Kosynierzy}
  spec.homepage      = "http://kosynierzy.info/"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 10.4"
  spec.add_development_dependency "rspec", "~> 3.1"

  spec.add_runtime_dependency "omniauth-oauth2", "~> 1.2"
end
