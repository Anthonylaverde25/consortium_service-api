

Rails.application.routes.draw do
  mount_devise_token_auth_for "User", at: "auth", controllers: {
    sessions: "auth/sessions",
    registrations: "registrations" ## tener en cuenta que podria auth/registrations
  }

  post "auth/validate_token", to: "auth#validate_token"


  resources :users
  resources :roles
  resources :entities
  resources :consortiums
  resources :department

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest"
end
