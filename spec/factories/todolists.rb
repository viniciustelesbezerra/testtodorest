# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :todolist do
    description "MyString"
    user nil
    priority 1
  end
end
