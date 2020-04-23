require Rails.root.join('lib/strategies/password_strategy').to_s
Warden::Strategies.add(:password, PasswordStrategy)
