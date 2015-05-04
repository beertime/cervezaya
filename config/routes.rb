Rails.application.routes.draw do

  namespace :api do
  get 'promotions/index'
  end

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'welcome#index'

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
