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
    query = params[:q]
    return render json: { products: [], categories: [], artists: [] } unless query.present?

    product_results = Product.search(query).includes(:artist, :product_category).take(5)
    category_results = ProductCategory.search(query).take(5)
    artist_results = Artist.search(query).take(5)

    render json: {
      products: product_results.as_json(include: %i[artist product_category]),
      categories: category_results,
      artists: artist_results
    }
  end
end
