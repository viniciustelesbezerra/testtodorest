module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in  FactoryGirl.create(:user) { |u| 
                u.todolists.create(attributes_for(:todolist)) 
                u.todolists.create(attributes_for(:todolist_without_user)) 
              }
    end
  end
  
  def login_user_not_allowed
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in FactoryGirl.create(:user_not_unique) { |u| u.todolists.create(attributes_for(:todolist)) } 
    end
  end

end
