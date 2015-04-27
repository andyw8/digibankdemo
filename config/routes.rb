Rails.application.routes.draw do
  constraints Clearance::Constraints::SignedOut.new do
    root to: "homes#show", via: :get
  end

  constraints Clearance::Constraints::SignedIn.new do
    root to: "dashboards#show", via: :get, as: :signed_in_root
  end

  resource :dashboard, only: [:show]
  resource :registration, only: [:new, :create]
  resources :transfers, only: [:new, :create]
end
