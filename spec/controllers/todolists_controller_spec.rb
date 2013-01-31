require 'spec_helper'

describe TodolistsController do
  
  describe "Not Signed In" do
    login_user_not_allowed
    let!(:todolist) { FactoryGirl.create(:todolist_without_user) }
    
    it "Not Allowed" do
        get :edit, id: todolist.to_param
        response.code.should eq("302")
    end

  end

  describe "Signed In" do
    login_user
    let!(:todolist) { Todolist.first }

    describe "GET index" do
      it "assigns all todolists as @todolists" do
        get :index
        Todolist.all.should include(todolist)
      end

      it "renders the index view" do
        get :index
        response.should render_template :index
      end

    end

    describe "GET show" do
      it "assigns the requested todolist as @todolist" do
        get :show, id: todolist.to_param
        assigns(:todolist).should eq(todolist)
      end

      it "renders the show view" do
        get :show, id: todolist.to_param
        response.should render_template :show
      end

    end

    describe "GET new" do
      it "assigns a new todolist as @todolist" do
        get :new
        assigns(:todolist).should be_a_new(Todolist)
      end

      it "renders the new view" do
        get :new
        response.should render_template :new
      end

    end

    describe "GET edit" do
      it "assigns the requested todolist as @todolist" do
        get :edit, id: todolist.to_param
        assigns(:todolist).should eq(todolist)
      end

      it "renders the edit view" do
        get :edit, id: todolist.to_param
        response.should render_template :edit
      end

    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Todolist" do
          expect {
            post :create, todolist: FactoryGirl.attributes_for(:todolist)
          }.to change(Todolist, :count).by(1)
        end

        it "assigns a newly created todolist as @todolist" do
          post :create, todolist: FactoryGirl.attributes_for(:todolist)
          assigns(:todolist).should be_a(Todolist)
          assigns(:todolist).should be_persisted
        end

        it "redirects to the created todolist" do
          post :create, todolist: FactoryGirl.attributes_for(:todolist)
          response.should redirect_to(Todolist.last)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved todolist as @todolist" do
          Todolist.any_instance.stub(:save).and_return(false)
          post :create, todolist: FactoryGirl.attributes_for(:todolist_invalid)
          assigns(:todolist).should be_a_new(Todolist)
        end

        it "redirect_to with errors" do
          Todolist.any_instance.stub(:save).and_return(false)
          post :create, todolist: FactoryGirl.attributes_for(:todolist_invalid)
          response.code.should eq("302")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested todolist" do
          Todolist.any_instance.should_receive(:update_attributes)
          put :update, {:id => todolist.to_param, todolist: FactoryGirl.attributes_for(:todolist)}
        end

        it "assigns the requested todolist as @todolist" do
          put :update, {:id => todolist.to_param, todolist: FactoryGirl.attributes_for(:todolist)}
          assigns(:todolist).should eq(todolist)
        end

        it "redirects to the todolist" do
          put :update, {:id => todolist.to_param, todolist: FactoryGirl.attributes_for(:todolist)}
          response.should redirect_to(todolist)
        end
      end

      describe "with invalid params" do
        it "assigns the todolist as @todolist" do
          Todolist.any_instance.stub(:save).and_return(false)
          put :update, {:id => todolist.to_param, todolist: FactoryGirl.attributes_for(:todolist_invalid)}
          assigns(:todolist).should eq(todolist)
        end

        it "redirect_to with errors" do
          Todolist.any_instance.stub(:save).and_return(false)
          put :update, {:id => todolist.to_param, todolist: FactoryGirl.attributes_for(:todolist_invalid)}
          response.code.should eq("302")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested todolist" do
        expect {
          delete :destroy, id: todolist.to_param
        }.to change(Todolist, :count).by(-1)
      end

      it "redirects to the todolists list" do
        delete :destroy, id: todolist.to_param
        response.should redirect_to(todolists_url)
      end
    end

  end
    
end
