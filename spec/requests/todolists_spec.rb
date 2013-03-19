require 'spec_helper'

describe "Todolists" do
  before :each do
    user = FactoryGirl.create(:user)
    visit "/users/sign_in"

    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password

    click_button "Sign in"

  end

  describe "GET /todolists" do
    xit "redirect_to" do
      get todolists_path
      response.status.should be(302)
    end

  end

  describe "GET index" do
    xit "Open url and Validate text" do
      get todolists_path
      sleep(5)
      page.should have_content("Listing todolists")
    end

  end  

  describe "GET new" do
    xit "Open Modal and Validate input" do 
      get todolists_path
      click_link("New Todolist")
      sleep(5)
      page.should have_content("New todolist")
    end
  
  end
    
end
