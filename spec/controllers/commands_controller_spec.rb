
require 'rails_helper'

RSpec.describe IntegrationTestKit::CommandsController do
  routes { IntegrationTestKit::Engine.routes }
  
  describe 'POST #create' do
    
    before do
      allow(IntegrationTestKit).to receive(:run_command)
    end
    
    it 'calls the run command method correctly' do
      post :create, params: { name: 'example' }
      
      expect(IntegrationTestKit).to have_received(:run_command).with('example')
    end
    
    it 'responds with success' do
      post :create, params: { name: 'example' }
      
      expect(response).to have_http_status(200)
    end
  end
end

