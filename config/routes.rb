Rails.application.routes.draw do

  root to: 'posts#home'

  resources :members, constraints: { format: :html }

  resources :faqs, constrains: { format: :html }

  resources :sessions, constraints: { format: :html }
  get 'sessions/new'
  get 'signin', to: 'sessions#new', as: 'signin'
  get 'signout', to: 'sessions#destroy', as: 'signout'

  resources :users, constriants: { format: :html }
  get 'signup', to: 'users#new', as: 'signup'

  resources :posts, constraints: { format: :html }
  get 'meetings', to: 'posts#meetings'
  get 'join', to: 'posts#join', as: 'join'
  get 'donate', to: 'posts#donate', as: 'donate'
  get 'contact', to: 'posts#contact', as: 'contact'
  get 'sponsors', to: 'posts#sponsors', as: 'sponsors'
  get 'donate_vehi-cle', to: 'posts#donate_vehicle', as: 'donate_vehicle'
  get 'posts/:id/activate', to: 'posts#activate', as: 'activate_post'
  get 'posts/:id/deactivate', to: 'posts#deactivate', as: 'deactivate_post'
  get 'donation_download', to: 'posts#donation_download'
  get 'equipment_download', to: 'posts#equipment_download'
  get 'application_download', to: 'posts#application_download'

  resources :searches, constraints: { format: :html }
  # get route to destroy a record comes in handy, requires admin privs
  get 'searches/:id/destroy', to: 'searches#destroy', via: :delete, as: 'destroy'

end
