# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    name "MyString"
    price 1

    trait :invalid do
    end

    factory :product_invalid, traits: [:invalid]
  end
end
