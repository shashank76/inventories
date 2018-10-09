class ProductsController < ApplicationController
  before_action :require_user

  def index
  	@products = Product.all#.order("price asc")
  end
end
