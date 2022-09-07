Rails.application.routes.draw do
  
  namespace :api, defaults: { format: :json }, path: "/" do
    resources :invoices, only: [:create, :index, :show] do
      patch :mark_as_paid, action: :update, controller: 'invoices/mark_as_paid'
      patch :mark_as_waiting_for_payment, action: :update, controller: 'invoices/mark_as_waiting_for_payment'
    end
  end

end
