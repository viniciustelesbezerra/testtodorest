require 'spec_helper'

describe "Productlists" do
  describe "GET index" do
    it "Open url and Validate text" do
      get products_path
      sleep(5)
      page.should have_content("Listing products")
    end
  end

  describe "GET new" do
    it "Open Modal and Validate input" do 
      get products_path
      click_link("New Product")
      sleep(5)
      page.should have_content("New product")
    end
  end
end
