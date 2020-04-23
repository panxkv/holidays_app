# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email {Faker::Internet.email}
    password {'Start!123'}
  end
end
