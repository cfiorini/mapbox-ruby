lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mapbox/version'

Gem::Specification.new do |spec|
  spec.add_dependency 'excon', '~> 0.45.3'
  spec.add_dependency 'polylines', '~> 0.2.0'
  spec.add_development_dependency 'bundler', '~> 1.0'
  spec.add_development_dependency 'pry'
  spec.authors = ['Claudio Fiorini']
  spec.description = 'A Ruby interface to the Mapbox API.'
  spec.email = %w(claudio.fiorini@gmail.com)
  spec.files = %w(LICENSE.md README.md mapbox-ruby.gemspec) + Dir['lib/**/*.rb']
  spec.homepage = 'https://github.com/cfiorini/mapbox-ruby'
  spec.licenses = %w(MIT)
  spec.name = 'mapbox-ruby'
  spec.require_paths = %w(lib)
  spec.required_ruby_version = '>= 2.1.0'
  spec.required_rubygems_version = '>= 1.3.5'
  spec.summary = spec.description
  spec.version = Mapbox::VERSION
end
