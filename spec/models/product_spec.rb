require 'spec_helper'

describe Product do
	let!(:product) { FactoryGirl.create(:product) }

	describe "Instance Validations" do
		it { product.should be_instance_of Product }
		it { product.should be_valid }
	end

	describe "Attributes Validations" do
		it { should validate_presence_of(:name) }
		it { should validate_presence_of(:price) }
	end

    describe "Assigments" do
	    
	    describe "Allowed" do
	      [:name, :price,].each do |attr| 
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
    	it { product.name.should eq("MyString") }
    	it { product.price.should eq(1) }
    end
end
