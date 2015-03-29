# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pechkinrb/version'

Gem::Specification.new do |spec|
  spec.name          = "pechkinrb"
  spec.version       = Pechkinrb::VERSION
  spec.authors       = ["Alexandr Prokopenko"]
  spec.email         = ["prokopenko@igc.ru"]
  spec.summary       = %q{Interface for pechkin-mail.ru service API}
  spec.description   = %q{Interface for pechkin-mail.ru service API}
  spec.homepage      = "https://github.com/crsde/PechkinRb"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_runtime_dependency 'faraday'
  spec.add_runtime_dependency 'faraday_middleware'
end
