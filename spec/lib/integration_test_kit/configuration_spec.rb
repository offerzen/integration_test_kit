require 'rails_helper'
require 'integration_test_kit/configuration'

RSpec.describe IntegrationTestKit::Configuration do
  let(:configuration_instance) { described_class.new }

  it 'sets the command load path correctly' do
    configuration_instance.commands_load_path = 'spec/cypress/commands'

    expect(configuration_instance.commands_load_path).to eq('spec/cypress/commands')
  end
end
