FactoryBot.define do
    factory :user do
        sequence(:username) { |n| "user#{n}" }
        sequence(:password) { |n| "pass#{n}" }
    end
end