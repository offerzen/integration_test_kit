module IntegrationTestKit
  class EnvironmentError < ::StandardError
    def initialize(msg='Rails environment must be "test"')
      super
    end
  end
end
