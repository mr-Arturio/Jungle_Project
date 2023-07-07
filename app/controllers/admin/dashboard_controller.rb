class Admin::DashboardController < ApplicationController
  def show
    # Using AR models in the ERB view 
    # @product_count =  Product.count
    # @category_count = Category.count

      # Fetch the data in the controller and assign it to instance variables
      @product_count = fetch_product_count
      @category_count = fetch_category_count
  end
  
  private

  def fetch_product_count
    Product.count
  end

  def fetch_category_count
    Category.count
  end
end
