BootstraDevisePosgtreSQLOnRails::Application.routes.draw do
  get "calendar/index"

  get "calendar/show"

  get "calendar/edit"

  get "calendar/update"

  get "calendar/destroy"

  get "report/index"

  get "report/show"

  resources :services

  resources :contacts_repaiers

  resources :repairers

  resources :fleets

  resources :contact_truck_fleets

  resources :truck_fleets

  authenticated :user do
    root :to => 'report#index'
  end
  unauthenticated :user do
    devise_scope :user do 
      get "/" => "report#index"
    end
  end
  devise_for :users
  resources :users, :only => [:show, :index]
end
