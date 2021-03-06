Rails.application.routes.draw do


  get 'search/search'
  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    get 'items/search' => 'items#search'

    resources :items, only: [:index, :show] do
      resources :comments, only: [:create, :destroy, :index]
    end
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]

    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'

    resources :orders, only: [:index, :show, :new, :create]
    
    resources :contacts, only: [:new, :create]
    post 'contacts/confirm' => 'contacts#confirm', as: 'contacts_confirm'
    post 'contacts/back' => 'contacts#back'
    get 'contacts/done' => 'contacts#done'

    resources :cart_items, only: [:index, :create, :update]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    delete 'cart_items/:id' => 'cart_items#destroy', as: 'destroy'

    get 'customers/my_page' => 'customers#show', as: 'customer'
    get 'customers/edit' => 'customers#edit', as: 'edit_customers'
    patch 'customers' => 'customers#update', as: 'customers'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'
  end

  devise_for :customers, controllers: { registrations: 'public/customers/registrations' }

  # ========= 管理者(admin)のルーティング ================
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations',
    passwords: 'admins/passwords'
  }

  namespace :admin do
    get '/' => 'homes#top', as: 'top'
    get 'search' => 'search#search', as: 'search'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    # ジャンル削除機能追加しました
    delete 'genres/:id' => 'genres#destroy', as: 'destroy'
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :orders, only: [:show, :update] do
      resources :order_items, only: [:update]
    end
    resources :contacts, only: [:index, :show]
  end

end