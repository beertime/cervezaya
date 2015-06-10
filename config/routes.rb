Rails.application.routes.draw do

  constraints subdomain: /^admin|beta/ do
    ActiveAdmin.routes(self)
    devise_for :admin_users, ActiveAdmin::Devise.config
  end

  namespace :api, constraints: { subdomain: /^api|beta-api/ }, path: '/', defaults: { format: :json } do

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

    resources :contacts, :only => [:create]

  end

  root 'welcome#index'

end
