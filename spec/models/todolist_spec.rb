require 'spec_helper'

describe Todolist do
	let!(:todolist) { FactoryGirl.create(:todolist) }

	describe "Instance Validations" do
		it { todolist.should be_instance_of Todolist }
		it { todolist.should be_valid }
	end

	describe "Realations" do
		it { should belong_to(:user) }
	end

	describe "Attributes Validations" do
		it { should validate_presence_of(:description) }
		it { should validate_presence_of(:priority) }
	end

    describe "Assigments" do
	    
	    describe "Allowed" do
	      [:description, :priority, :user_id].each do |attr| 
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
    	it { todolist.description.should eq("MyString") }
    	it { todolist.priority.should eq(1) }
		it { todolist.user.should eq(User.where(id: todolist.user_id).first) }

    end

end
	