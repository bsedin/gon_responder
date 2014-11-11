# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gon_responder/version'

Gem::Specification.new do |spec|
  spec.name          = "gon_responder"
  spec.version       = GonResponder::VERSION
  spec.authors       = ["Sergey Besedin"]
  spec.email         = ["kr3ssh@gmail.com"]
  spec.summary       = %q{GonResponder for responders gem}
  spec.description   = %q{respond_with gon}
  spec.homepage      = "https://github.com/kressh/gon_responder"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'responders', '~> 1.0'
  spec.add_dependency 'gon', '~> 5.0'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
