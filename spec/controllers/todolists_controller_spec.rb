require 'spec_helper'

describe TodolistsController do
  login_user
  let!(:todolist) { FactoryGirl.create(:todolist) }

  def valid_attributes
    { "description" => "MyString" }
  end

  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all todolists as @todolists" do
      get :index
      assigns(:todolists).should include(todolist)
    end

    it "renders the index view" do
      get :index
      response.should render_template :index
    end

  end

  describe "GET show" do
    it "assigns the requested todolist as @todolist" do
      todolist = Todolist.create! valid_attributes
      get :show, {:id => todolist.to_param}, valid_session
      assigns(:todolist).should eq(todolist)
    end
  end

  describe "GET new" do
    it "assigns a new todolist as @todolist" do
      get :new, {}, valid_session
      assigns(:todolist).should be_a_new(Todolist)
    end
  end

  describe "GET edit" do
    it "assigns the requested todolist as @todolist" do
      todolist = Todolist.create! valid_attributes
      get :edit, {:id => todolist.to_param}, valid_session
      assigns(:todolist).should eq(todolist)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Todolist" do
        expect {
          post :create, {:todolist => valid_attributes}, valid_session
        }.to change(Todolist, :count).by(1)
      end

      it "assigns a newly created todolist as @todolist" do
        post :create, {:todolist => valid_attributes}, valid_session
        assigns(:todolist).should be_a(Todolist)
        assigns(:todolist).should be_persisted
      end

      it "redirects to the created todolist" do
        post :create, {:todolist => valid_attributes}, valid_session
        response.should redirect_to(Todolist.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved todolist as @todolist" do
        # Trigger the behavior that occurs when invalid params are submitted
        Todolist.any_instance.stub(:save).and_return(false)
        post :create, {:todolist => { "description" => "invalid value" }}, valid_session
        assigns(:todolist).should be_a_new(Todolist)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Todolist.any_instance.stub(:save).and_return(false)
        post :create, {:todolist => { "description" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested todolist" do
        todolist = Todolist.create! valid_attributes
        # Assuming there are no other todolists in the database, this
        # specifies that the Todolist created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Todolist.any_instance.should_receive(:update_attributes).with({ "description" => "MyString" })
        put :update, {:id => todolist.to_param, :todolist => { "description" => "MyString" }}, valid_session
      end

      it "assigns the requested todolist as @todolist" do
        todolist = Todolist.create! valid_attributes
        put :update, {:id => todolist.to_param, :todolist => valid_attributes}, valid_session
        assigns(:todolist).should eq(todolist)
      end

      it "redirects to the todolist" do
        todolist = Todolist.create! valid_attributes
        put :update, {:id => todolist.to_param, :todolist => valid_attributes}, valid_session
        response.should redirect_to(todolist)
      end
    end

    describe "with invalid params" do
      it "assigns the todolist as @todolist" do
        todolist = Todolist.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Todolist.any_instance.stub(:save).and_return(false)
        put :update, {:id => todolist.to_param, :todolist => { "description" => "invalid value" }}, valid_session
        assigns(:todolist).should eq(todolist)
      end

      it "re-renders the 'edit' template" do
        todolist = Todolist.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Todolist.any_instance.stub(:save).and_return(false)
        put :update, {:id => todolist.to_param, :todolist => { "description" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested todolist" do
      todolist = Todolist.create! valid_attributes
      expect {
        delete :destroy, {:id => todolist.to_param}, valid_session
      }.to change(Todolist, :count).by(-1)
    end

    it "redirects to the todolists list" do
      todolist = Todolist.create! valid_attributes
      delete :destroy, {:id => todolist.to_param}, valid_session
      response.should redirect_to(todolists_url)
    end
  end

end
