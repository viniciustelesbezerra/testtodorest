require 'spec_helper'

describe TodolistsController do
  
  describe "Signed In" do
    login_user
    let!(:todolist) { User.where(email: "user@gmail.com").first.todolists }
    let!(:current_user) { User.where(email: "user@gmail.com").first }
    
    describe "GET index" do
      it "assigns all todolists as @todolists" do
        get :index
        current_user.todolists.should eq(todolist)
      end

      it "renders the index view" do
        get :index
        response.should render_template :index
      end

    end

    describe "GET show" do
      it "assigns the requested todolist as @todolist" do
        get :show, { user_id: current_user.to_param, id: todolist.first.to_param }
        assigns(:todolist).should eq(todolist.first)
      end

      it "renders the show view" do
        get :show, { user_id: current_user.to_param, id: todolist.first.to_param }
        response.should render_template :show
      end

    end

    describe "GET new" do
      it "assigns a new todolist as @todolist" do
        get :new, user_id: current_user.to_param
        assigns(:todolist).should be_a_new(Todolist)
      end

      it "renders the new view" do
        get :new, user_id: current_user.to_param
        response.should render_template :new
      end

    end

    describe "GET edit" do
      it "assigns the requested todolist as @todolist" do
        get :edit, { user_id: current_user.to_param, id: todolist.first.to_param }
        assigns(:todolist).should eq(todolist.first)
      end

      it "renders the edit view" do
        get :edit, { user_id: current_user.to_param, id: todolist.first.to_param }
        response.should render_template :edit
      end

    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Todolist" do
          expect {
            post :create, { user_id: current_user.to_param, id: todolist.first.to_param, todolist: FactoryGirl.attributes_for(:todolist) }
          }.to change{current_user.todolists.count}
        end

        it "assigns a newly created todolist as @todolist" do
          post :create, { user_id: current_user.to_param, id: todolist.first.to_param, todolist: FactoryGirl.attributes_for(:todolist) }
          assigns(:todolist).should be_a(Todolist)
          assigns(:todolist).should be_persisted
        end

        it "redirects to the created todolist" do
          post :create, { user_id: current_user.to_param, id: todolist.first.to_param, todolist: FactoryGirl.attributes_for(:todolist) }
          response.code.should eq("302")
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved todolist as @todolist" do
          current_user.todolists.any_instance.stub(:save).and_return(false)
          post :create, { user_id: current_user.to_param, id: todolist.first.to_param, todolist: FactoryGirl.attributes_for(:todolist_invalid) }
          assigns(:todolist).should be_a_new(Todolist)
        end

        it "redirect_to with errors" do
          current_user.todolists.any_instance.stub(:save).and_return(false)
          post :create, { user_id: current_user.to_param, id: todolist.first.to_param, todolist: FactoryGirl.attributes_for(:todolist_invalid) }
          response.code.should eq("302")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested todolist" do
          current_user.todolists.any_instance.should_receive(:update_attributes)
          put :update, { user_id: current_user.to_param, id: todolist.first.to_param, todolist: FactoryGirl.attributes_for(:todolist) }
        end

        it "assigns the requested todolist as @todolist" do
          put :update, { user_id: current_user.to_param, id: todolist.first.to_param, todolist: FactoryGirl.attributes_for(:todolist) }
          assigns(:todolist).should eq(todolist.first)
        end

        it "redirects to the todolist" do
          put :update, { user_id: current_user.to_param, id: todolist.first.to_param, todolist: FactoryGirl.attributes_for(:todolist) }
          response.should redirect_to(user_todolist_url)
        end
      end

      describe "with invalid params" do
        it "assigns the todolist as @todolist" do
          current_user.todolists.any_instance.stub(:save).and_return(false)
          put :update, { user_id: current_user.to_param, id: todolist.first.to_param, todolist: FactoryGirl.attributes_for(:todolist_invalid) }
          assigns(:todolist).should eq(todolist.first)
        end

        it "redirect_to with errors" do
          current_user.todolists.any_instance.stub(:save).and_return(false)
          put :update, { user_id: current_user.to_param, id: todolist.first.to_param, todolist: FactoryGirl.attributes_for(:todolist_invalid) }
          response.code.should eq("302")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested todolist" do
        puts todolist.all.count.inspect
        expect {
          delete :destroy, { user_id: current_user.to_param, id: todolist.first.to_param }
        }.to change{current_user.todolists.count}
      end

      it "redirects to the todolists list" do
        delete :destroy, { user_id: current_user.to_param, id: todolist.first.to_param }
        response.should redirect_to(user_todolists_url)
      end
    end

  end
    
end
