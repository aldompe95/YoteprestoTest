Rails.application.routes.draw do
	root "dashboard#home"
	devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  resources :profile
  resources :requisitions
end
