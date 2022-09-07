child @invoices => :invoices do
  extends "/api/invoices/attributes"
end

node :pagination do
  {
    size:         @invoices.size,
    current_page: @invoices.current_page,
    total_pages:  @invoices.total_pages,
    total_count:  @invoices.total_count
  }
end