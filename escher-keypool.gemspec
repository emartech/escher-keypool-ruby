# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'escher/version'

Gem::Specification.new do |spec|
  spec.name = 'escher-keypool'
  spec.version = Escher::Keypool::VERSION
  spec.authors = ['Emarsys']
  spec.email = ['andras.barthazi@emarsys.com']

  spec.summary = %q{Keypool for Escher}
  spec.description = %q{Manages keys using environment variables.}
  spec.homepage = 'https://github.com/emartech/escher-keypool-ruby'

  spec.files = ['lib/escher-keypool.rb', 'lib/escher/version.rb']
  spec.license = 'MIT'
end
