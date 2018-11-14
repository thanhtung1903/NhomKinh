Rails.application.routes.draw do
  namespace :admin do
    devise_for :users

    get "/" => "ad_users#index"
    resources :ad_users, except: :show
  end
end
