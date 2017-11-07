Rails.application.routes.draw do
  resources :gossips
  devise_for :users
  get 'home/index'


root 'home#index'
resources :users do
	resources :gossips
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
