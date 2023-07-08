class Admin::CategoriesController < ApplicationController
before_action :authenticate # ensuring that the authenticate method is called before accessing any action


  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to %i[admin categories], notice: "Category created!"
    else
      render :new
    end
  end

  def authenticate # performs the authentication
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["AUTH_USERNAME"] && password == ENV["AUTH_PASSWORD"]
    end
  end

end
