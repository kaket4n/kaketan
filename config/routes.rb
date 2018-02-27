Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :diaries
  resources :comments
  resources :picks
  get "/admin", to: "admin#index"
  namespace :admin do
    resources :diaries
    resources :picks
    resources :images
  end
  get "/terms", to: "pages#terms"
  get "/privacy", to: "pages#privacy"
  get "/spirit", to: "pages#spirit"
  get "/career", to: "pages#career"
  root "home#index"
end
