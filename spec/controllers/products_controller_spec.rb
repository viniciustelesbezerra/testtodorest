require 'spec_helper'

describe ProductsController do
  describe "Signed In" do
    let!(:product) { FactoryGirl.create(:product) }
    
    describe "GET index" do
      it "assigns all products as @products" do
        get :index
        product.should eq(product)
      end

      it "renders the index view" do
        get :index
        response.should render_template :index
      end
    end

    describe "GET show" do
      it "assigns the requested product as @product" do
        get :show, { id: product.to_param }
        assigns(:product).should eq(product)
      end

      it "renders the show view" do
        get :show, { id: product.to_param }
        response.should render_template :show
      end
    end

    describe "GET new" do
      it "assigns a new product as @product" do
        get :new
        assigns(:product).should be_a_new(Product)
      end

      it "renders the new view" do
        get :new
        response.should render_template :new
      end
    end

    describe "GET edit" do
      it "assigns the requested product as @product" do
        get :edit, { id: product.to_param }
        assigns(:product).should eq(product)
      end

      it "renders the edit view" do
        get :edit, { id: product.to_param }
        response.should render_template :edit
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new product" do
          expect {
            post :create, { id: product.to_param, product: FactoryGirl.attributes_for(:product) }
          }.to change{Product.count}
        end

        it "assigns a newly created product as @product" do
          post :create, { id: product.to_param, product: FactoryGirl.attributes_for(:product) }
          assigns(:product).should be_a(Product)
          assigns(:product).should be_persisted
        end

        it "redirects to the created product" do
          post :create, { id: product.to_param, product: FactoryGirl.attributes_for(:product) }
          response.code.should eq("302")
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved product as @product" do
          Product.any_instance.stub(:save).and_return(false)
          post :create, { id: product.to_param, product: FactoryGirl.attributes_for(:product_invalid) }
          assigns(:product).should be_a_new(Product)
        end

        it "redirect_to with errors" do
          Product.any_instance.stub(:save).and_return(false)
          post :create, { id: product.to_param, product: FactoryGirl.attributes_for(:product_invalid) }
          response.code.should eq("302")
        end
      end
    end

    describe "PUT update" do
      describe "with valid params" do
        it "updates the requested product" do
          Product.any_instance.should_receive(:update_attributes)
          put :update, { id: product.to_param, product: FactoryGirl.attributes_for(:product) }
        end

        it "assigns the requested product as @product" do
          put :update, { id: product.to_param, product: FactoryGirl.attributes_for(:product) }
          assigns(:product).should eq(product)
        end

        it "redirects to the product" do
          put :update, { id: product.to_param, product: FactoryGirl.attributes_for(:product) }
          response.should redirect_to(product_url)
        end
      end

      describe "with invalid params" do
        it "assigns the product as @product" do
          Product.any_instance.stub(:save).and_return(false)
          put :update, { id: product.to_param, product: FactoryGirl.attributes_for(:product_invalid) }
          assigns(:product).should eq(product)
        end

        it "redirect_to with errors" do
          Product.any_instance.stub(:save).and_return(false)
          put :update, { id: product.to_param, product: FactoryGirl.attributes_for(:product_invalid) }
          response.code.should eq("302")
        end
      end
    end

    describe "DELETE destroy" do
      it "destroys the requested product" do
        expect {
          delete :destroy, { id: product.to_param }
        }.to change{Product.count}
      end

      it "redirects to the products list" do
        delete :destroy, { id: product.to_param }
        response.should redirect_to(products_url)
      end
    end
  end
end
