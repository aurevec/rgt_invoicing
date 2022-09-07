class CustomerMailer < ApplicationMailer 

  def reminder(invoice)
    @invoice = invoice
    mail(to: @invoice.email, subject: t("emails.customer.reminder.subject"))
  end
  
end