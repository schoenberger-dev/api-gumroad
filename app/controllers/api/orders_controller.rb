class Api::OrdersController < ApplicationController
  def index
    @orders = Order.all
    render json: @orders
  end

  def show
    @order = Order.find(params[:id])
    render json: @order
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Order not found' }, status: :not_found
  end

  def create
    order = Order.create(order_params.merge(user: current_user))

    order_params[:products].each do |product_id, details|
      product = Product.find(product_id)
      order.order_products.create(product:, quantity: details[:quantity])
    end

    order_params[:tips].each do |artist_id, tip_amount|
      artist = Artist.find(artist_id)
      order.tips.create(artist:, amount: tip_amount)
    end

    render json: order, status: :created
  end

  private

  def order_params
    params.require(:order).permit(products: [:quantity], tips: %i[artist_id tip_amount])
  end
end
