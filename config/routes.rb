Rails.application.routes.draw do

  root to: 'point_tracker#tracker'
  devise_for :members, controllers: { omniauth_callbacks: 'members/omniauth_callbacks' }
  devise_scope :member do
    get 'members/sign_in', to: 'members/sessions#new', as: :new_member_session
    get 'members/sign_out', to: 'members/sessions#destroy', as: :destroy_member_session
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

  resources :services do
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
