Rails.application.routes.draw do
  namespace :api do
    get 'carts/show'
  end
  mount_devise_token_auth_for "User", at: "api/auth"
  namespace :api do
    resources :products, only: %i[index]

  end
  # get '/api/carts', controller: :carts, action: :show
end
