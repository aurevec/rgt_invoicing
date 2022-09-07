class Api::Invoices::MarkAsPaidController < Api::BaseController

  def update
    @invoice = get_invoice
    @invoice.mark_as_paid
    render "/api/invoices/show"
  end

  private

  def get_invoice 
    Invoice.find_by(id: params[:invoice_id])
  end

end