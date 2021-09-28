Rails.application.routes.draw do
  namespace :api do
    get 'products/index'
  end
  namespace :api do
    resources :products, only: %i[index show]
  end
end
