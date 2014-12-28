# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'order_order/version'

Gem::Specification.new do |spec|
  spec.name          = "order_order"
  spec.version       = OrderOrder::VERSION
  spec.authors       = ["George Millo"]
  spec.email         = ["georgejulianmillo@gmail.com"]
  spec.summary       = %q{Order in the (ActiveRecord) court!}
  spec.description   = %q{Simple extensions to ActiveRecord for common 'order' queries}
  spec.homepage      = "http://github.com/headstock/order_order"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
