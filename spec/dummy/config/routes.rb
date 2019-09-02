Rails.application.routes.draw do
  mount IntegrationTestKit::Engine => "/integration_test_kit"
end
