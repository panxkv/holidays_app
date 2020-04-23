# frozen_string_literal: true

module CurrentUser
  def current_user
    request.env['warden'].user(:user)
  end

  def authenticate!
    request.env['warden'].authenticate!(:password, scope: :user)
  end

  def login!(user)
    env['warden'].set_user(user, scope: :user)
  end

  def logout!
    request.env['warden'].logout(:user)
  end

  def authenticated?
    request.env['warden'].authenticated?(:user)
  end

  def force_authentication!
    error!({ message: [I18n.t('errors.messages.not_logged')] }, 401) unless authenticated?
  end
end
