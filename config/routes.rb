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

  resources :equipment_categories

  resources :events
    get 'calendar', to: 'events#index'
    get 'searches', to: 'events#searches'

  resources :groups

  resources :images, constraints: {format: :html}

  resources :incidents
    get 'callout', to: 'incidents#callout'
    get 'incidents/:id/add_members', to: 'incidents#add_members'
    get 'incidents/:id/remove_member/:member_id', to: 'incidents#remove_member'
    get 'incidents/:id/update_member/:member_id', to: 'incidents#update_member'

  resources :members
    get 'update_members', to: 'members#update_members'

  resources :messages

  resources :posts, constraints: {format: :html}
    get 'posts/:id/activate', to: 'posts#activate', as: 'activate_post'
    get 'posts/:id/deactivate', to: 'posts#deactivate', as: 'deactivate_post'
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
    patch :set_password, to: 'users#set_password'
    get :forgot_password, to: 'users#forgot_password'
    post :password_email, to: 'users#password_email'

  resources :pages, constraints: {format: :html} #Not in alphabetical order, pages is always last!
    get 'last_version', to: 'pages#last_version'
    get '/:page', to: 'pages#page'

end
