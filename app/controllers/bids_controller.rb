class BidsController < ApplicationController
  def index
    render json: Bid.all
  end
end
