class ProductsController < ApplicationController
  before_action :require_user

  def index
  	@products = Product.all.order("created_at desc").paginate(page: params[:page], per_page: 20)
  end
end
