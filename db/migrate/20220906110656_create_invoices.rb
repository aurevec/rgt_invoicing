class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.string :email, null: false
      t.string :status, default: "waiting_for_payment", null: false
      t.integer :waiting_for_payment_counter, default: 1
      t.timestamps
    end
  end
end
