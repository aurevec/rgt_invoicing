class Api::InvoicesController < Api::BaseController

  def index 
    @invoices = Invoice.all

    render "/api/invoices/index"
  end

  def create
    @invoice = Invoice.new(invoice_params)

    if @invoice.save
      render "/api/invoices/show", status: :created
    else
      render json: @invoice.errors, status: :unprocessable_entity
    end
  end

  private 

    def invoice_params
      params.require(:invoice).permit(:email, :document)
    end
end