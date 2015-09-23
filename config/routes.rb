Rails.application.routes.draw do

  root 'my_library#home'

  get 'login/user' => 'sessions#new_user', as: :login_user
  get 'login/admin' => 'sessions#new_admin', as: :login_admin
  post 'login/user' => 'sessions#create_user'
  post 'login/admin' => 'sessions#create_admin'
  delete 'logout/user' => 'sessions#destroy_user', as: :logout_user
  delete 'logout/admin' => 'sessions#destroy_admin', as: :logout_admin
  get 'signup' => 'users#new'

  resources :users
  resources :admins
  resources :books
  get '/checkout/book/:id' => 'checkout_histories#show_book', as: :checkout_book
  get '/checkout/user/:id' => 'checkout_histories#show_user', as: :checkout_user
  get '/checkout/create/book/:id' =>  'checkout_histories#create', as: :create_checkout
  get '/checkout/update/book/:id' =>  'checkout_histories#update', as: :update_checkout
  post '/checkout/create/book/:id' => 'checkout_histories#create_admin', as: :create_admin_checkout

  #get '/books/:id' => 'books#show', as: :book
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
