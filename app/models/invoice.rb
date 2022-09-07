class Invoice < ApplicationRecord 
  extend Enumerize

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_one_attached :document
  validates :document, presence: true, content_type: [:docx, :doc, :pdf]

  enumerize :status, in: [:expired, :paid, :waiting_for_payment], default: :waiting_for_payment, scope: true

  def mark_as_paid  
    update_attribute(:status, :paid)
  end

  def mark_as_waiting_for_payment 
    update_attribute(:status, :waiting_for_payment)
  end

  def document_url
    Rails.application.routes.url_helpers.rails_blob_path(document, only_path: true)
  end

end