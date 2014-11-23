class InvoicesController < ApplicationController
  def index
    render json: Invoice.all
  end
end
