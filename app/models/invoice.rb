class Invoice < ApplicationRecord 
  extend Enumerize

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_one_attached :document
  validates :document, presence: true, content_type: [:docx, :doc, :pdf]

  enumerize :status, in: [:expired, :paid, :waiting_for_payment], default: :waiting_for_payment, scope: true

  scope :status_updated_between, lambda {|start_date, end_date| where("status_updated_at >= ? AND status_updated_at <= ?", start_date, end_date )}


  def mark_as_paid  
    update(status: :paid, status_updated_at: DateTime.now)
  end

  def mark_as_waiting_for_payment 
    update(status: :waiting_for_payment, status_updated_at: DateTime.now)
  end

  def document_url
    Rails.application.routes.url_helpers.rails_blob_path(document, only_path: true)
  end

end