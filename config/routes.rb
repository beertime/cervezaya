Rails.application.routes.draw do

  # Admin routes
  constraints subdomain: "#{ENV['ADMIN_SUBDOMAIN']}" do
    ActiveAdmin.routes(self)
    devise_for :admin_users, ActiveAdmin::Devise.config
  end

  # API Routes
  namespace :api, constraints: { subdomain: "#{ENV['API_SUBDOMAIN']}" }, path: '/', defaults: { format: :json } do

    # API V1
    api_version(module: 'V1', header: { name: 'Accept', value: 'application/vnd.cervezaya.com; version=1' }, default: true) do

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

    # API V2
    api_version(module: 'V2', header: { name: 'Accept', value: 'application/vnd.cervezaya.com; version=2' }) do

      with_options only: :index do |r|
        r.resources :types
      end

    end
  end

  # Landing routes
  root 'welcome#index'

  get 'bares', to: 'static#business'
  get 'prensa', to: 'static#press'
  get 'legal', to: 'static#legal'
  get 'contacto', to: 'static#contact'

  # Mailer routes
  match '/business_contact', to: 'contact#bussines_mail', via: 'post'
  match '/ios_contact', to: 'contact#ios_mail', via: 'post'

end
