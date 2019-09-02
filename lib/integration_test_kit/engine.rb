module IntegrationTestKit
  class Engine < ::Rails::Engine
    isolate_namespace IntegrationTestKit
  end
end
