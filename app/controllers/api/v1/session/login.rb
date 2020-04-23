module API
  module V1
    module Session
      class Login < Grape::API
        post do
          authenticate!
        end
      end
    end
  end
end
