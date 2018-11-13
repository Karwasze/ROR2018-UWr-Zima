Rails.application.routes.draw do
  namespace :admin do
    root to: 'places#index'
    resources :categories
    resources :countries
    resources :places
    resources :users
  end

  namespace :place_owner do
    resources :places
  end

  get 'static/terms'
  get 'about-us', to: 'static#about', as: :about

  authenticated :user do
    root to: "places#index", as: :authenticated_root
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'welcome#index'

  resources :places, only: %i(show index)
  resources :categories, only: %i(show)

end
