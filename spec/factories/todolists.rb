# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :todolist do
    description "MyString"
    priority 1
    association :user, factory: :user_not_unique
  end
  
end
