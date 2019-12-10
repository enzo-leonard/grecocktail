Rails.application.routes.draw do
  resources :cocktails do 
    resources :doses
  end 
  root to: 'cocktails#index'
  get '/learn', to: 'cocktails#learn'
  devise_for :users
end
