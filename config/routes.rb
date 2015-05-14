Rails.application.routes.draw do

  namespace :api do
  get 'bars/show'
  end

  root 'admin/dashboard#index'

  ActiveAdmin.routes(self)
  devise_for :users, ActiveAdmin::Devise.config

  namespace :api, constraints: { subdomain: 'api' }, path: '/', defaults: { format: :json } do

    with_options only: :index do |r|
      r.resources :types
      r.resources :sizes
      r.resources :promotions
      r.resources :brands
    end

    resources :bars, :only => [:index, :show] do
      resources :opinions, :only => [:index, :create]
    end

    resources :users, :only => [:show, :create, :update, :destroy] do
      resources :favorites, :only => [:index, :create, :destroy]
      resources :recents, :only => [:index, :create]
      resources :ranks, :only => [:show, :create]
    end

  end

end
