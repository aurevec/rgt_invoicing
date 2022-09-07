desc "This task archives old invoices"
task :archive_invoices => :environment do
  puts "Archiving invoices..."
  
  invoices = Invoice.with_status(:waiting_for_payment).where(Invoice.arel_table[:status_updated_at].lt(1.week.ago))
  invoices.each {|invoice| invoice.update(status: :expired, status_updated_at: DateTime.now)}

  puts "Done (#{invoices.count} updated)."
end