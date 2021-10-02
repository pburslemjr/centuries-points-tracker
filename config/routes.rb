Rails.application.routes.draw do
  get 'events/index'
  get 'events/show'
  get 'events/new'
  get 'events/edit'
  get 'events/delete'

  resources :events do
    member do
      get :delete
    end
  end  
  
  get 'dashboard/index'
  get 'dashboard/properties'
  get 'dashboard/reports'
  # get 'admin/create_event'
  get 'tos' => 'info#tos'
  get 'privacy' => 'info#privacy'
  root 'home#index'
  get 'home/index'
  get 'service_logger/service'
  get 'point_tracker/tracker'
  get 'login', to: 'logins#new'
  get 'login/create', to: 'logins#create', as: :create_login
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
