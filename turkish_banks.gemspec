# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'turkish_banks/version'

Gem::Specification.new do |spec|
  spec.name          = "turkish_banks"
  spec.version       = TurkishBanks::VERSION
  spec.authors       = ["Ender Ahmet Yurt"]
  spec.email         = ["enderyurt@gmail.com"]

  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = ""
  # end

  spec.summary       = "Fetch Turkish Banks and their branches."
  spec.description   = "Fetch the all data about Turkish Banks and their branches."
  spec.homepage      = "https://github.com/enderahmetyurt/turkish_banks"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "nokogiri", "~> 1.6.0"
  spec.add_development_dependency "activesupport"
  spec.add_development_dependency "turkish_support"
end
