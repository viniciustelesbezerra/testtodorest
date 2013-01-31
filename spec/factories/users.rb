# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  	factory :user, class: "User" do
    	password "user123456"
    	password_confirmation {|au| au.password}
    	email "user@gmail.com"
  
	  	trait :not_unique do
	    	password "user123456"
	    	password_confirmation {|au| au.password}
	    	email "user_not_unique@gmail.com"
	    end

	  	trait :invalid do
	  	end

	  	factory :user_not_unique, traits: [:not_unique]
	  	factory :user_invalid, traits: [:invalid]

  	end

end
