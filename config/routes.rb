Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }
  resources :users
  get 'simple_pages/landing_page'
  resources :products do
    resources :comments
  end
  resources :orders, only: [:index, :show, :create, :destroy]
  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/index'
  # get 'simple_pages#landing_page'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'simple_pages#landing_page'

  #get '/products/:id', to: 'products#show'

  #thank you routes
  post 'simple_pages/thank_you'

end
