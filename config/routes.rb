# Rails.application.routes.draw do
#   # mount_devise_token_auth_for "User", at: "auth", controllers: {
#   #   registrations: "users/registrations"
#   # }

#   devise_for :users, controllers: {
#     registrations: "users/registrations"
#   }


#   resources :users
#   resources :roles
#   resources :entities
#   resources :consortiums


#   ## esto indica que Rails va a utilizar el modelo User para la autenticacionny registro de usuarios
#   ## at: "auth", esta parte especifica el prefijo de la ruta. Esto quiere decir que todas las rutas relacionadas con Devise Token Auth para el modelo User estaran disponible bajo la ruta base /auth
#   ##




#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
#   get "up" => "rails/health#show", as: :rails_health_check
#   get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
#   get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

#   # Defines the root path route ("/")
#   # root "posts#index"
# end


Rails.application.routes.draw do
  # mount_devise_token_auth_for "User", at: "auth"
  mount_devise_token_auth_for "User", at: "auth", controllers: {
    registrations: "registrations"
  }

  resources :users
  resources :roles
  resources :entities
  resources :consortiums

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest"
end
