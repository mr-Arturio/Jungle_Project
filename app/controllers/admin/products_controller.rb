class Admin::ProductsController < ApplicationController
  before_action :authenticate # ensuring that the authenticate method is called before accessing any action

  def index
    @products = Product.order(id: :desc).all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to %i[admin products], notice: "Product created!"
    else
      render :new
    end
  end

  def destroy
    @product = Product.find params[:id]
    @product.destroy
    redirect_to %i[admin products], notice: "Product deleted!"
  end

  private

  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :category_id,
      :quantity,
      :image,
      :price,
    )
  end

  def authenticate # performs the authentication
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["AUTH_USERNAME"] && password == ENV["AUTH_PASSWORD"]
    end
  end
end
