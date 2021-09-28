Rails.application.routes.draw do
  namespace :api do
    get 'products/index'
  end
  namespace :api do
    resources :products, only: %i[index show]
    namespace :v0 do
      resources :pings, only: [:index], constraints: { format: 'json' }
    end
  end
end
