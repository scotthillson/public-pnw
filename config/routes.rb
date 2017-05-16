Rails.application.routes.draw do

  root to: 'pages#home'

  resources :activities
    get 'update_activities', to: 'activities#update_activities'

  resources :prospect_applications
    get 'prospect_application', to: 'prospect_applications#prospect_application'
    post 'submit_new_member_application', to: 'prospect_applications#submit_application'

  resources :carpools, constraints: {format: :html}
    get 'carpools/:id/reserve', to: 'carpools#reserve', as: :reserve_seat

  resources :discussions, contraints: {format: :html}

  resources :equipment
    patch 'session_equipment', to: 'equipment#session_equipment'

  resources :equipment_categories

  resources :events
    get 'calendar', to: 'events#index'
    get 'searches', to: 'events#searches'

  resources :groups

  resources :images, constraints: {format: :html}

  get 'incidents/active', to: 'incidents#active'
  post 'incidents/create', to: 'incidents#create'
  patch 'update_incident_member', to: 'incident_members#update_member'

  resources :incidents
    post 'incidents/:id/add_members', to: 'incidents#add_members'
    delete 'incidents/:id/remove_member', to: 'incidents#remove_member'

  resources :locations
    post 'report_location', to: 'locations#new_with_token'

  resources :members
    get 'update_members', to: 'members#update_members'

  resources :messages
    get 'update_messages', to: 'messages#update_messages'
    get 'incident_messages', to: 'messages#incident'
    post 'new_message', to: 'messages#new_with_token'

  resources :posts, constraints: {format: :html}
    get 'posts/:id/activate', to: 'posts#activate', as: :activate_post
    get 'posts/:id/deactivate', to: 'posts#deactivate', as: :deactivate_post
    get 'donation_download', to: 'posts#donation_download'
    get 'equipment_download', to: 'posts#equipment_download'

  resources :rentals, constraints: {format: :html}
    get 'rentals/:id/reserve', to: 'rentals#reserve', as: :reserve_rental

  resources :sessions, constraints: {format: :html}
    get 'signout', to: 'sessions#destroy'
    get 'signin', to: 'sessions#new'
    get 'sessions/new'

  resources :sponsors, contraints: {format: :html}

  resources :users, constriants: {format: :html}
    get :signup, to: 'users#signup'
    get 'users/:id/swap_role', to: 'users#swap_role', as: :swap_role
    get :forgot_password, to: 'users#forgot_password'
    patch :set_password, to: 'users#set_password'
    post :password_email, to: 'users#password_email'

  resources :pages, constraints: {format: :html} #Not in alphabetical order, pages is always last!
    get 'last_version', to: 'pages#last_version'
    get '/:page', to: 'pages#page'

end
