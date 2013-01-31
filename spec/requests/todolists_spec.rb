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
    it "works! (now write some real specs)" do
      get todolists_path
      response.status.should be(302)
    end
  end

end
