class Api::InvoicesController < Api::BaseController

  def index 

    @invoices = if(params[:filter] == 'to_mark_as_waiting_for_payment')
      Invoice.with_status(:waiting_for_payment).status_updated_between(1.week.ago.beginning_of_day, 1.week.ago.end_of_day)
    elsif(params[:filter] == 'expired')
      Invoice.with_status(:expired)
    else
      Invoice.all
    end

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

  def show 
    @invoice = get_invoice
    render "/api/invoices/show"
  end

  private 

  def get_invoice 
    Invoice.find_by(id: params[:id])
  end

  def invoice_params
    params.require(:invoice).permit(:email, :document)
  end
  
end