
FactoryBot.define do
  factory :organization do
    title { 'Test org' }
    description { 'Test org' }
    purpose { 'Test purpose'}
    association :user, factory: :user
  end
end