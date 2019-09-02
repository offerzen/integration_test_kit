require 'rails_helper'
require 'integration_test_kit/registry'

RSpec.describe IntegrationTestKit::Registry do
  
  describe '#command' do
    
    let(:registry_instance) { described_class.new }
    
    it 'defines a new command' do
      registry_instance.command(:test) { 8 }
      
      expect(IntegrationTestKit.commands.key?(:test)).to be_truthy
    end
    
    context 'when a command name is defined with a string' do
    
      it 'stores the command name as a symbol' do
        registry_instance.command('test_with_string') { 2 }
        
        expect(IntegrationTestKit.commands.key?(:test_with_string)).to be_truthy
      end
    end
    
    it 'stores a proc within the commands hash' do
      registry_instance.command(:test) { 6 }
      
      expect(IntegrationTestKit.commands[:test]).to be_a(Proc)
    end
    
    it 'stores the defined proc correctly' do
      example_proc = Proc.new { 7 }
      allow(example_proc).to receive(:call)
      
      registry_instance.command(:test, &example_proc)
    
      IntegrationTestKit.commands[:test].call
      expect(example_proc).to have_received(:call)
    end
  end
end