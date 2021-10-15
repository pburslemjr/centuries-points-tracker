Rails.application.routes.draw do

  root to: 'point_tracker#tracker'
  devise_for :admins, controllers: { omniauth_callbacks: 'admins/omniauth_callbacks' }
  devise_scope :admin do
    get 'admins/sign_in', to: 'admins/sessions#new', as: :new_admin_session
    get 'admins/sign_out', to: 'admins/sessions#destroy', as: :destroy_admin_session
  end
  #root 'home#index'
  #service page
  get 'service_logger/new'
  get 'service_logger/index'
  get 'service_logger/edit'
  get 'service_logger/delete'
  get 'service_logger/show'
  

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
  get 'point_tracker/tracker'
  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
