Rails.application.routes.draw do


  























  # ========= 管理者(admin)のルーティング ================
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations',
    passwards: 'admins/passwards'
  }

  namespace :admin do
    get '/' => 'orders#index', as: 'index'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update] do
      resources :order_items, only: [:update]
    end
  end

end