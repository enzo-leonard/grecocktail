Rails.application.routes.draw do
  resources :cocktails do 
    resources :doses
  end 
  root to: 'cocktails#index'
  get '/learn', to: 'cocktails#learn'
  get '/test', to: 'cocktails#test'
  devise_for :users
end
