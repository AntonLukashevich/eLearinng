# frozen_string_literal: true
#
FactoryBot.define do
  factory :staff do
    email { Faker::Internet.email }
    organization
  end
end