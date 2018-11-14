Rails.application.routes.draw do
  namespace :admin do
    devise_for :users

    get "/" => "users#index"
  end
end
