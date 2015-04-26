Rails.application.routes.draw do

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'welcome#index'

  namespace :api, defaults: { format: :json } do
    resources :products, :only => [:show, :index]
  end

end
