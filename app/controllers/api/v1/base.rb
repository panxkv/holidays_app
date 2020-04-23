module API
  module V1
    class Base < Grape::API
      helpers CurrentUser

      version "v1"
      format :json

      use Warden::Manager do |manager|
        manager.default_strategies :password_strategy
        manager.failure_app = ->(_env) { [401, {}, ['Not authorized']] }
      end

      mount Session::Root
    end
  end
end
