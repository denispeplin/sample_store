class OrdersController < ApplicationController
  def index
    render json: Order.all
  end

  def update
    @order = Order.find params[:id]

    if @order.update_attributes(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order).permit(:sold)
  end
end
