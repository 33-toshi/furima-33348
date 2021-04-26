class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    @product = Product.find(params[:product_id])
    @product_order = ProductOrder.new
    redirect_to root_path if current_user == @product.user
  end

  def create
    @product = Product.find(params[:product_id])
    @product_order = ProductOrder.new(order_params)

    if @product_order.valid?
      pay_item
      @product_order.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:product_order).permit(:postal_code, :area_id, :city, :house_number, :building_name, :phone_number).merge(
      token: params[:token], user_id: current_user.id, product_id: params[:product_id]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
