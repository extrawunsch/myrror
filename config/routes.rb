Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :forms, only: [:new, :create, :show] do
    resources :questions, only: [:index, :new, :create]
  end
end
