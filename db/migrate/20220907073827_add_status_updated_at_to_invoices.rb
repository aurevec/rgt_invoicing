class AddStatusUpdatedAtToInvoices < ActiveRecord::Migration[7.0]
  def change
    add_column :invoices, :status_updated_at, :datetime, null: false, default: DateTime.now
  end
end
