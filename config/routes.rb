Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :notes
  resources :picks
  get "/admin", to: "admin#index"
  namespace :admin do
    resources :notes
    resources :picks
  end
  get "/terms", to: "pages#terms"
  get "/privacy", to: "pages#privacy"
  get "/spirit", to: "pages#spirit"
  root "home#index"
end
