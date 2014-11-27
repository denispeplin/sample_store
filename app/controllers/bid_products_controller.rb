class BidProductsController < ApplicationController
  def update
    @bid_product = BidProduct.find params[:id]

    if @bid_product.update_attributes(bid_product_params)
      render json: @bid_product
    else
      render json: @bid_product.errors, status: :unprocessable_entity
    end
  end

  private

  def bid_product_params
    params.require(:bid_product).permit(:amount)
  end
end
