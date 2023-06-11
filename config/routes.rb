Rails.application.routes.draw do


  get "/", to: 'public/homes#top', as: :customers_homes_top
  get "homes/about", to: 'public/homes#about', as: :customers_homes_about
  root to: "public/homes#top"

  devise_for :customers, controllers: {
    sessions:      'public/sessions',
    passwords:     'public/passwords',
    registrations: 'public/registrations'
  }
  devise_for :admins, skip: [:registrations, :passwords] ,controllers: {
    sessions:      'admins/sessions',
   # passwords:     'admins/passwords',
   # registrations: 'admins/registrations'
  }

  #devise_for :publics
  #devise_for :admins

  namespace :admins do
    #get 'orders/show'
    resources :orders
    resources :customers
    #get 'genres/index'
    #post 'genres/create'
    #get 'genres/:id/edit', to: 'genres#edit', as: 'genres_edit'
    resources :genres
    resources :items
    get 'homes/top'
  end

  scope module: :public do
  # #namespace :customer do
  #   get 'customers/show/:id', to: 'public/customers#show', as: :customers_customers_show
  #   get 'customers/edit/:id', to: 'public/customers#edit', as: :customers_customers_edit
  #   patch 'customers/edit/:id', to: 'public/customers#update'
     get '/unsubscribe', to: 'customers#unsubscribe', as: :customer_unsubscribe
    resources :customers
  # #end
  # #namespace :public do
  #   get 'addersses/index', to: 'public/addersses#index', as: :customers_addersses_index
  #   get 'addersses/edit', to: 'public/addersses#edit', as: :customers_addersses_edit
    resources :addresses
  # #end
  # #namespace :public do
  #   get 'oders/new', to: 'public/oders#new', as: :customers_oders_new
  #   get 'oders/complete', to: 'public/oders#complete', as: :customers_oders_complete
  #   get 'oders/index', to: 'public/oders#index', as: :customers_oders_index
  #   get 'oders/show', to: 'public/oders#show', as: :customers_oders_show
    resources :orders do
      collection do
        post 'comfirm'
        get 'complete'
      end
    end
  # #namespace :public do
  #   get 'cart_items/index', to: 'public/cart_items#index', as: :customers_cart_itemes_index
    resources :cart_items do
      collection do
        delete '/' => 'cart_items#all_destroy'
      end
    end

  #end
  # namespace :public do
    #get 'items/index', to: 'public/items#index', as: :public_itemes_index
    #get 'items/show', to: 'public/items#show', as: :public_itemes_show
    resources :items
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
