require 'spec_helper'

describe User do
	let!(:user) { FactoryGirl.create(:user) }

	describe "Instance Validations" do
		it { user.should be_instance_of User }
		it { user.should be_valid }
	end

	describe "Relations" do
		it { should embed_many(:todolists) }
	end

	describe "EnsureIndex" do
		it { should have_index_for(name: 1) } 
	end

	describe "Attributes validations" do
		it { should_not allow_value("email").for(:email) }
  		it { should allow_value("user@gmail.com").for(:email) }
	end

    describe "Assigments" do
	    describe "Allowed" do
	      [:email, :name].each do |attr| 
	        it { should allow_mass_assignment_of(attr) }
	      end
	    end

	    describe "Not allowed" do
	        it { should_not allow_mass_assignment_of(:_id) }
	    end

    end

    describe "Acceptance samples" do
    	it { user.email.should eq("user@gmail.com") }
    end

end
