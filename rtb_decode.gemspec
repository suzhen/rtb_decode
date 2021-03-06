# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rtb_decode/version'

Gem::Specification.new do |spec|
  spec.name          = "rtb_decode"
  spec.version       = RtbDecode::VERSION
  spec.authors       = ["suezhen"]
  spec.email         = ["sz3001@gmail.com"]
  spec.summary       = %q{decode winning price from AdExchange.}
  spec.description   = %q{decode winning price from AdExchange.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
