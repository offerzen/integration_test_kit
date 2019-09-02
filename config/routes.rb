IntegrationTestKit::Engine.routes.draw do
  resources :commands, param: :name, only: :create
end
