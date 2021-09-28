Rails.application.routes.draw do
  get 'tos' => 'info#tos'
  get 'privacy' => 'info#privacy'
  root 'home#index'
  get 'home/index'
  get 'service_logger/service'
  get 'point_tracker/tracker'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
