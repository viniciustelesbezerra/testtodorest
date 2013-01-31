require 'spec_helper'

describe User do
	let!(:user) { FactoryGirl.create(:user) }

	describe "Instance Validations" do
		it { user.should be_instance_of User }
		it { user.should be_valid }
	end

	describe "Realations" do
		it { should have_many(:todolists) }
	end

    describe "Assigments" do
	    
	    describe "Allowed" do
	      [:email].each do |attr| 
	        it { should allow_mass_assignment_of(attr) }
	      end
	    end

	    describe "Not allowed" do
	      [:id, :_id, :_type].each do |attr| 
	        it { should_not allow_mass_assignment_of(attr) }
	      end
	    end

    end

    describe "Acceptance samples" do
    	it { user.email.should eq("user@gmail.com") }
		it { user.todolists.should eq([]) }

    end

end
