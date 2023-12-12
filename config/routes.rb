Rails.application.routes.draw do
  root 'bank_app#index'
  resources :bank_app # This looks for index, show, new, edit, create, update and destory
  get "/about" => "bank_app#about", as: :about
  get "/withdraw" => "bank_app#withdraw"
  post "/withdraw" => "bank_app#set_withdraw"

  get "/deposit" => "bank_app#deposit"
  post "/deposit" => "bank_app#set_deposit"
  
  get "/sign_up" => "registrations#new"
  post "/sign_up" => "registrations#create"
  delete "logout" => "sessions#destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

end