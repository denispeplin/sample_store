class InvoicesController < ApplicationController
  def index
    render json: Invoice.includes(:invoice_products).all
  end

  def update
    @invoice = Invoice.find params[:id]
    if @invoice.update_attributes(invoice_params)
      render json: @invoice
    else
      render json: @invoice.errors, status: :unprocessable_entity
    end
  end

  private

  def invoice_params
    params.require(:invoice).permit(:received)
  end
end
