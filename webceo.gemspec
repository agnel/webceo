# coding: utf-8
$:.push File.expand_path("../lib", __FILE__)
require 'webceo/version'

Gem::Specification.new do |spec|
  spec.name          = "webceo"
  spec.version       = Webceo.gem_version
  spec.platform      = Gem::Platform::RUBY
  spec.authors       = ["Agnel Waghela"]
  spec.email         = ["agnelwaghela@gmail.com"]

  spec.summary       = %q{API Client for accessing WebCEO API - http://www.webceo.com/}
  spec.homepage      = "https://github.com/agnel/webceo"
  spec.license       = "MIT"
  spec.metadata      = {
    'mailing_list_uri' => 'https://groups.google.com/forum/#!forum/webceo-api-client/',
    'changelog_uri' => 'https://github.com/agnel/webceo/blob/master/CHANGELOG.md'
  }

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

  spec.add_dependency 'httparty', '~> 0.14'
  spec.add_dependency 'multi_json', '~> 1.12'
  spec.add_dependency 'activesupport', '~> 4.2'
end
