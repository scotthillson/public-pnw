Rails.application.routes.draw do

  root to: 'pages#home'

  resources :searches, constraints: { format: :html }
  # get route to destroy a record comes in handy, requires admin privs
  get 'searches/:id/destroy', to: 'searches#destroy', via: :delete, as: 'destroy'

  resources :pages, constraints: {format: :html}
  get '/:page', to: 'pages#page'
  get 'last_version', to: 'pages#last_version'
  get 'donate_vehicle', to: 'pages#donate_vehicle'

  resources :sessions, constraints: { format: :html }
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'signin', to: 'sessions#new', as: 'signin'
  get 'sessions/new'

  resources :users, constriants: { format: :html }
  get 'signup', to: 'users#new', as: 'signup'

  resources :posts, constraints: { format: :html }
  get 'posts/:id/activate', to: 'posts#activate', as: 'activate_post'
  get 'posts/:id/deactivate', to: 'posts#deactivate', as: 'deactivate_post'
  get 'donation_download', to: 'posts#donation_download'
  get 'equipment_download', to: 'posts#equipment_download'
  get 'application_download', to: 'posts#application_download'

end
