require 'integration_test_kit'

module IntegrationTestKit
  class Registry
    def command(name, &block)
      IntegrationTestKit.commands[name.to_sym] = block
    end
  end
end
