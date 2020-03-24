$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'integration_test_kit/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'integration_test_kit'
  spec.version     = IntegrationTestKit::VERSION
  spec.authors     = ['Ethan Marrs']
  spec.email       = ['ethan@offerzen.com']
  spec.homepage    = 'https://github.com/Offerzen/integration_test_kit'
  spec.summary     = 'A small DSL for defining and calling integration test commands.'
  spec.description = 'Integration Test Kit provides a small DSL for defining integration test commands, and an endpoint for calling them locally.'
  spec.license     = 'MIT'

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'rails', '> 5.1'

  spec.add_development_dependency 'rspec', '~> 3.2'
  spec.add_development_dependency 'rspec-rails', '~> 3.8'
  spec.add_development_dependency 'sqlite3'
end
