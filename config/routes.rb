Rails.application.routes.draw do

  root to: 'posts#home'

  resources :pages, constraints: {format: :html}
  get 'faqs', to: 'pages#faqs'
  get 'about', to: 'pages#about'
  get 'meetings', to: 'pages#meetings'
  get 'join', to: 'pages#join', as: 'join'
  get 'donate', to: 'pages#donate', as: 'donate'
  get 'contact', to: 'pages#contact', as: 'contact'
  get 'sponsors', to: 'pages#sponsors', as: 'sponsors'
  get 'donate_vehicle', to: 'pagess#donate_vehicle', as: 'donate_vehicle'

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

  resources :searches, constraints: { format: :html }
  # get route to destroy a record comes in handy, requires admin privs
  get 'searches/:id/destroy', to: 'searches#destroy', via: :delete, as: 'destroy'

end
