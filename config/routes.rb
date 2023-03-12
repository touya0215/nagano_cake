Rails.application.routes.draw do
  get "/", to: 'public/homes#top', as: :public_homes_top
  get 'homes/about'
  namespace :admin do
    get 'orders/show'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/edit'
  end
  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/show'
    get 'items/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :admin do
    get 'sessions/new'
  end
  namespace :public do
    get 'addersses/index'
    get 'addersses/edit'
  end
  namespace :public do
    get 'oders/new'
    get 'oders/complete'
    get 'oders/index'
    get 'oders/show'
  end
  namespace :public do
    get 'cart_items/index'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/unsubscribe'
  end
  namespace :public do
    get 'sessions/new'
  end
  namespace :public do
    get 'registrations/new'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
