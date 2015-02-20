Rails.application.routes.draw do

  root to: 'posts#home'

  resources :members, constraints: { format: :html }

  resources :sessions, constraints: { format: :html }
  get 'sessions/new'
  get 'signin', to: 'sessions#new', as: 'signin'
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :users, constriants: { format: :html }
  get 'signup', to: 'users#new', as: 'signup'

  resources :posts, constraints: { format: :html }
  get 'join', to: 'posts#join', as: 'join'
  get 'donate', to: 'posts#donate', as: 'donate'
  get 'contact', to: 'posts#contact', as: 'contact'
  get 'sponsors', to: 'posts#sponsors', as: 'sponsors'
  get 'posts/:id/activate', to: 'posts#activate', as: 'activate_post'
  get 'posts/:id/deactivate', to: 'posts#deactivate', as: 'deactivate_post'
  get 'donation_download', to: 'posts#download_donation'
  get 'equipment_download', to: 'posts#download_equipment'
  get 'application_download', to: 'posts#download_application'

  resources :searches, constraints: { format: :html }
  # get route to destroy a record comes in handy, requires admin privs
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
