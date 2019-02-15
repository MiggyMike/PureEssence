Rails.application.routes.draw do
  get 'simple_pages/landing_page'
  resources :products
  resources :orders, only: [:index, :show, :create, :destroy]
  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'simple_pages#landing_page'
  #get '/products/:id', to: 'products#show'

  #thank you routes
  post 'simple_pages/thank_you'

end
