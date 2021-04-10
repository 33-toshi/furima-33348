class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private 

  def product_params
    params.require(:product).permit(:product_name, :description, :category_id, :detail_id, :delivery_fee_id, :area_id, :duration_id, :price, :image).merge(user_id: current_user.id)
  end
  
end
