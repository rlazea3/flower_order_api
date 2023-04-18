FactoryBot.define do
    factory :order do
        user
        sequence(:address) { |n| "address#{n}" }
        quantity { 3 }
        status { 'pending' }
    end
end