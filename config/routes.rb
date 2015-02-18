Rails.application.routes.draw do

  resources :users, :posts, :members, :searches, :sessions

  root to: 'posts#index'

  get 'sessions/new'

  get 'join', to: 'posts#join', as: 'join'

  get 'signup', to: 'users#new', as: 'signup'

  get 'donate', to: 'posts#donate', as: 'donate'

  get 'signin', to: 'sessions#new', as: 'signin'

  get 'contact', to: 'posts#contact', as: 'contact'

  get 'signout', to: 'sessions#destroy', as: 'signout'

  get 'sponsors', to: 'posts#sponsors', as: 'sponsors'

  get 'donation_download', to: 'posts#download_donation'

  get 'equipment_download', to: 'posts#download_equipment'

  get 'application_download', to: 'posts#download_application'

  # a get route to destroy a record comes in handy, and even requires admin privs
  get 'searches/:id/destroy', to: 'searches#destroy', via: :delete, as: 'destroy'

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