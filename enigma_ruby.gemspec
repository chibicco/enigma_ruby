# frozen_string_literal: true

require_relative "lib/enigma_ruby/version"

Gem::Specification.new do |spec|
  spec.name          = "enigma_ruby"
  spec.version       = EnigmaRuby::VERSION
  spec.authors       = ["chibicco"]
  spec.email         = ["me@chibicco.dev"]
  spec.summary       = %q{A Ruby implementation of the Enigma machine}
  spec.description   = %q{This gem allows you to simulate the encryption process of the Enigma machine.}
  spec.homepage      = "https://github.com/chibicco/enigma_ruby"
  spec.license       = "MIT"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files         = Dir["lib/**/*", "README.md"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
