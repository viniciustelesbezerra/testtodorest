# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :todolist do
    description "MyString"
    priority 1
    
  	trait :invalid do
  	end

  	factory :todolist_invalid, traits: [:invalid]
    association :user, factory: :user_not_unique
  
  end
  
  factory :todolist_without_user, class: Todolist do
    description "MyString"
    priority 1
  end

end
