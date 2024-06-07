class Api::OrdersController < ApplicationController
  def show
    @orders = Order.find(params[:id])
    render json: @orders
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Order not found' }, status: :not_found
  end

  def create
    @order = Order.new(create_order_params)
    if @order.save
      render json: @order, status: :created
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def create_order_params
    params.require(:order).permit(:amount, :user_id, :tip, product_ids: [])
  end
end
