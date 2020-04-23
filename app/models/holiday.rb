class Holiday < ApplicationRecord
  belongs_to :user, dependent: :destroy
end
