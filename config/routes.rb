Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  get 'service_logger/service'
  get 'point_tracker/tracker'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
