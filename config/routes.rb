Rails.application.routes.draw do

  root 'login#index'
  #service page
  get 'service_logger/new'
  get 'service_logger/index'
  get 'service_logger/edit'
  get 'service_logger/delete'
  get 'service_logger/show'
  get 'login/index', to:'login#index'
  get 'login/click', to:'login#click'
  

  resources :events do
    member do
      get :delete
    end
  end  

  resources :service_logger do
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
  get 'home/index'
  get 'service_logger/new', to: 'service_logger#new'
  post 'service_logger/index', to: 'service_logger#create'
  get 'login/logout', to: 'login#logout'
  
  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
