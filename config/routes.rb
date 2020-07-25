Rails.application.routes.draw do
  resources :orders
  resources :line_items
  resources :carts
  root 'store#index', as: 'store_index'
  resources :products
  get 'say/hello'
  get 'say/goodbye'

  resources :products do
    get :who_bought, on: :member
  end
end

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
