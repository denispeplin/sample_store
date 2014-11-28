class ProductsController < ApplicationController
  def index
    render json: Product.all
  end

  def update
    @product = Product.find params[:id]

    if @product.update_attributes(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  private

  def product_params
    params.require(:product).permit(:min_amount, :reserve)
  end
end