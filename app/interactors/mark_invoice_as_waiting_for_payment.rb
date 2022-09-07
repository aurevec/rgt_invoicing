class MarkInvoiceAsWaitingForPayment
  include Interactor

  def call
    change_status
    increment_counter!
    send_email
  end

  private

  def change_status 
    context.invoice.mark_as_waiting_for_payment
  end

  def increment_counter!
    context.invoice.increment! :waiting_for_payment_counter
  end

  def send_email 
    CustomerMailer.reminder(@context.invoice).deliver
  end
  
end