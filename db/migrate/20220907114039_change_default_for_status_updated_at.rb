class ChangeDefaultForStatusUpdatedAt < ActiveRecord::Migration[7.0]
  def change
    change_column_default :invoices, :status_updated_at, -> { 'now()' }
  end
end
