class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = get_product params[:id]
  end

  def new
    @product = Product.new
  end

  def edit
    @product = get_product params[:id]
  end

  def create
    @product = Product.new params[:product]
    set_flash_message 'Product was successfully created.','notice' if @product.save
    respond_with @product
  end

  def update
    @product = get_product params[:id]
    set_flash_message 'Product was successfully updated.','notice' if @product.update_attributes params[:product]
    respond_with @product
  end

  def destroy
    @product = get_product params[:id]
    set_flash_message 'Product was successfully deleted.','notice' if @product.destroy
    respond_with @product
  end

  private
  def get_product id
    Product.find id rescue redirect_to root_path, alert: "Not found."
  end
end
