Rails.application.routes.draw do

  root 'admin/dashboard#index'

  ActiveAdmin.routes(self)
  devise_for :users, ActiveAdmin::Devise.config

  namespace :api, constraints: { subdomain: 'api' }, path: '/', defaults: { format: :json } do

    with_options only: :index do |r|
      r.resources :types
      r.resources :sizes
      r.resources :promotions
    end

    with_options only: [:show, :index] do |r|
      r.resources :users
    end

  end

end
