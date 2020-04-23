# frozen_string_literal: true

module API
  module V1
    module Session
      class Authenticate < Grape::API
        get do
          force_authentication!
          present current_user, with: UserEntity
        end
      end
    end
  end
end
