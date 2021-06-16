Rails.application.routes.draw do

  devise_for :admins
  devise_for :customers
# devise_for :customers, controllers: {
#     sessions: 'customers/sessions',
#     registrations: 'customers/registrations',
#     passwards: 'customers/passwards'
#   }

#   scope module: :public do
#     root to: 'homes#top'
#     get 'about' => 'homes#about'

#     resources :items, only: [:index, :show]
#     resources :addresses, only: [:index, :create, :edit, :update, :destroy]

#     post 'orders/confirm' => 'orders#confirm'
#     get 'orders/complete' => 'orders#complete'

#     resources :orders, only: [:index, :show, :new, :create]

#     resources :cart_items, only: [:index, :create, :update]
#     delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
#     delete 'cart_items/:id' => 'cart_items#destroy', as: 'destroy'

#     get 'customers/my_page' => 'customers#show', as: 'customer'
#     get 'customers/edit' => 'customers#edit', as: 'edit_customers'
#     patch 'customers' => 'customers#update', as: 'customers'
#     get 'customers/unsubscribe' => 'customers#unsubscribe'
#     patch 'customers/withdraw' => 'customers#withdraw'
#   end

#   # ========= 管理者(admin)のルーティング ================
#   devise_for :admin, controllers: {
#     sessions: 'admin/sessions',
#     registrations: 'admin/registrations',
#     passwards: 'admin/passwards'
#   }

#   namespace :admin do
#     get '/' => 'homes#top', as: 'top'
#     resources :customers, only: [:index, :show, :edit, :update]
#     resources :genres, only: [:index, :create, :edit, :update]
#     resources :items, only: [:index, :new, :create, :show, :edit, :update]
#     resources :orders, only: [:show, :update] do
#       resources :order_items, only: [:update]
#     end
#   end

end