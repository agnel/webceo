# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'webceo/version'

Gem::Specification.new do |spec|
  spec.name          = "webceo"
  spec.version       = Webceo.gem_version
  spec.authors       = ["Agnel Waghela"]
  spec.email         = ["agnelwaghela@gmail.com"]

  spec.summary       = %q{API Client for accessing WebCEO API - http://www.webceo.com/}
  spec.homepage      = "http://agnelwaghela.in/project/webceo-api-client"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'airborne', '~> 0.2.7'

  spec.add_dependency 'httparty', '~> 0.14', '>= 0.14.0'
  spec.add_dependency 'multi_json', '~> 1.12', '>= 1.12.2'
  spec.add_dependency 'activesupport', '~> 4.2', '>= 4.2.3'
end
