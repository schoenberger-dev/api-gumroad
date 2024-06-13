class Api::ProductsController < ApplicationController
  def index
    @products = Product.includes(:artist, :product_category).all
    render json: @products, include: %i[artist product_category]
  end

  def show
    @product = Product.find(params[:id])
    render json: @product
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Product not found' }, status: :not_found
  end

  def create
    @product = Product.new(create_product_params)
    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def create_product_params
    params.require(:product).permit(:name, :image, :description, :price, :product_category_id, :artist_id)
  end

  def search
    @results = if params[:q].present?
                 Product.search(params[:q])
               else
                 []
               end
    render json: @results
  end
end
