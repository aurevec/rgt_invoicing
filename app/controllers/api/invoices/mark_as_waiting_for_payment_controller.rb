class Api::Invoices::MarkAsWaitingForPaymentController < Api::BaseController

  def update
    @invoice = get_invoice
    result = ::MarkInvoiceAsWaitingForPayment.call(invoice: @invoice)

    if result.success?
      render "/api/invoices/show"
    else
      render json: "Unable to change invoice status", status: :unprocessable_entity
    end
  end

  private

  def get_invoice 
    Invoice.find_by(id: params[:invoice_id])
  end

end