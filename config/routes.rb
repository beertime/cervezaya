Rails.application.routes.draw do

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

    resources :bars, :only => [:index]
    resources :users, :only => [:show, :create]

  end

end
