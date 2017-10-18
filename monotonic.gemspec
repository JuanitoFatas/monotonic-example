# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "monotonic/version"

Gem::Specification.new do |spec|
  spec.name          = "monotonic"
  spec.version       = Monotonic::VERSION
  spec.authors       = ["Juanito Fatas"]
  spec.email         = ["katehuang0320@gmail.com"]

  spec.summary       = %(Get monotonic time in Ruby, JRuby)
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/JuanitoFatas/monotonic"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
