Mytruckfleet::Application.routes.draw do
  resources :service_types
  resources :notifications
  resources :settings
  resources :subscribtions
  resources :trainings
  resources :drivers

  get "calendar/view"
  get "calendar/index"
  get "calendar/show"
  get "calendar/edit"
  get "calendar/update"
  get "calendar/destroy"
  get "report/index"
  post "report/index"
  get "report/show"
  
  resources :fault_books do
    member do 
      get 'postpone'
      put 'postponed'
      get 'cancel'
      put 'cancel'
    end
  end

  resources :services do
    member do
      get 'finish'
      post 'finish'
    end
  end
  resources :customers, :except => [:show]
  resources :contacts_repaiers
  resources :repairers
  # match 'fleets/postponed/id', :controller => "fleets", :action => "postponed", :via => :post
  resources :fleets do 
    member do
      get 'postpone'
      put 'postponed'
      get 'cancel'
      put 'cancel'
    end
  end
  
  resources :contact_truck_fleets
  resources :truck_fleets

  authenticated :user do
    root :to => 'calendar#index'
  end
  
  unauthenticated :user do
    devise_scope :user do 
      get "/" => "devise/sessions#new"
    end
  end
  
  devise_for :users, :skip => [:sessions]

  as :user do
    get 'signin' => 'devise/sessions#new', :as => :new_user_session
    post 'signin' => 'devise/sessions#create', :as => :user_session
    delete 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  
end
