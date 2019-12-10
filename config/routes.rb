Rails.application.routes.draw do
  resources :cocktails do 
    resources :doses
  end 
  root to: 'cocktails#index'
  devise_for :users
end
