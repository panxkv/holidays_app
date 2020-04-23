# frozen_string_literal: true

module API
  module V1
    module Session
      class Root < Grape::API
        version 'v1', using: :path, vendor: 'api'
        format :json

        namespace :session do
          mount Authenticate
          mount Login
          mount Logout
        end
      end
    end
  end
end
