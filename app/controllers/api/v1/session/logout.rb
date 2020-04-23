# frozen_string_literal: true

module API
  module V1
    module Session
      class Logout < Grape::API
        delete do
          logout!
          200
        end
      end
    end
  end
end
