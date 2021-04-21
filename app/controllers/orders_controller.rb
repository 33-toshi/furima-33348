class OrdersController < ApplicationController

  def index
    @product = Product.find(params[:product_id])
  end

  def new
  end

  def create
    @product_order = ProductOrder.new(order_params)
      if @product_order.valid?
        @product_order.save
        redirect_to action: :index
      else
        render action: :new
      end
  end

private

  def order_params
    params.require(:product_order).premit(:postal_code, :area_id, :city, :house_number, :building_name, :postal_code)
  end
end
