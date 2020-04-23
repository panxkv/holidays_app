# frozen_string_literal: true

class PasswordStrategy < ::Warden::Strategies::Base
  def valid?
    params['email'] && params['password']
  end

  def authenticate!
    user = User.find_by(email: params['email'])
    if user&.authenticate(params['password'])
      success!(user)
    else
      fail!('strategies.password.failed')
    end
  end
end
