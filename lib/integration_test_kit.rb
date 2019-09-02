require "integration_test_kit/engine"
require "integration_test_kit/configuration"
require "integration_test_kit/registry"

module IntegrationTestKit
  @commands = {}

  def self.commands
    @commands
  end
  
  def self.configuration
    @configuration ||= Configuration.new
  end
  
  def self.configure
    yield configuration
    
    Dir[Rails.root.join(configuration.commands_load_path, '*.rb')].each do |file|
      require File.expand_path(file)
    end
  end

  def self.run_command(name)
    @commands[name.to_sym].call

    true
  end

  def self.define(&block)
    registry = Registry.new
    registry.instance_eval(&block)
  end
end
