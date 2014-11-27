class BidsController < ApplicationController
  def index
    render json: Bid.all
  end

  def update
    @bid = Bid.find params[:id]

    if @bid.update_attributes(bid_params)
      render json: @bid
    else
      render json: @bid.errors, status: :unprocessable_entity
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:placed, combine: [])
  end
end
