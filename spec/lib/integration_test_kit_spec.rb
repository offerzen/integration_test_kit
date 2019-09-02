require 'rails_helper'
require 'integration_test_kit'

RSpec.describe IntegrationTestKit do
  
  describe '.configuration' do
    
    it 'returns a configuration object' do
      expect(described_class.configuration).to be_a(IntegrationTestKit::Configuration)
    end
  end
  
  describe '.configure' do
    
    before do
      allow(described_class).to receive(:require)
      
      described_class.configure do |config|
        config.commands_load_path = 'spec/cypress/commands'
      end
    end
    
    it 'allows for the commands load path to be configured' do
      expect(described_class.configuration.commands_load_path).to eq('spec/cypress/commands')
    end
    
    it 'requires files inside the commands load path' do
      expect(described_class).to have_received(:require).with(/spec\/cypress\/commands\/test.rb/)
    end
  end
  
  describe '.define' do
    
    it 'evaluates block within the context of the registry' do
      expect_any_instance_of(described_class::Registry).to receive(:command).with(:test)
      
      described_class.define do
        command(:test) { 5 }
      end
    end
  end
  
  describe '.run_command' do
    
    it 'calls the defined proc correctly' do
      example_proc = Proc.new { 7 }
      allow(example_proc).to receive(:call)
      
      described_class.define do
        command(:test, &example_proc)
      end
    
      described_class.run_command(:test)
      expect(example_proc).to have_received(:call)
    end
    
    it 'returns true' do
      example_proc = Proc.new { 7 }
      
      described_class.define do
        command(:test, &example_proc)
      end
    
      expect(described_class.run_command(:test)).to be_truthy
    end
  end
end
