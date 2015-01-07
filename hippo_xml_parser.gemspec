# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hippo_xml_parser/version'

Gem::Specification.new do |spec|
  spec.name          = 'hippo_xml_parser'
  spec.version       = HippoXmlParser::VERSION
  spec.authors       = ['Jared Fraser']
  spec.email         = ['dev@jsf.io']
  spec.summary       = %q{Parser for Hippo XML exports}
  spec.description   = %q{}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'nokogiri'

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3.1'
end
