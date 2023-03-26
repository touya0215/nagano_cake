Rails.application.routes.draw do


  get "/", to: 'public/homes#top', as: :public_homes_top
  get "homes/about", to: 'public/homes#about', as: :public_homes_about

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :public, controllers: {
    sessions:      'public/sessions',
    passwords:     'public/passwords',
    registrations: 'public/registrations'
  }
  #devise_for :publics
  #devise_for :admins

  namespace :admins do
    get 'orders/show'
  end
  namespace :admins do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admins do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admins do
    get 'items/index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
  end
  namespace :admins do
    get 'homes/top'
  end
  #namespace :public do
    get 'customers/show', to: 'public/customers#show', as: :public_customers_show
    get 'customers/edit', to: 'public/customers#edit', as: :public_customers_edit
    get 'customers/unsubscribe', to: 'public/customers#unsubscribe', as: :public_customers_unsubscribe
  #end
  #namespace :public do
    get 'addersses/index', to: 'publicaddersses/#index', as: :public_addersses_index
    get 'addersses/edit', to: 'public/addersses#edit', as: :public_addersses_edit
  #end
  #namespace :public do
    get 'oders/new', to: 'public/oders#new', as: :public_oders_new
    get 'oders/complete', to: 'public/oders#complete', as: :public_oders_complete
    get 'oders/index', to: 'public/oders#index', as: :public_oders_index
    get 'oders/show', to: 'public/oders#show', as: :public_oders_show
  #end
  #namespace :public do
    get 'cart_items/index', to: 'public/cart_items#index', as: :public_cart_itemes_index
  #end
  #namespace :public do
    get 'items/index', to: 'public/items#index', as: :public_itemes_index
    get 'items/show', to: 'public/items#show', as: :public_itemes_show
  #end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
