module IntegrationTestKit
  class CommandsController < ApplicationController
    def create
      IntegrationTestKit.run_command(params[:name])
      
      head :ok
    end
  end
end
