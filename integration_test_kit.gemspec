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

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com"
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'rails', '~> 5.1.6'

  spec.add_development_dependency 'rspec', '~> 3.2'
  spec.add_development_dependency 'rspec-rails', '~> 3.8'
  spec.add_development_dependency 'sqlite3'
end
