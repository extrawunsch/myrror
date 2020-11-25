Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/feedback', to: 'pages#feedback'
  get '/error', to: 'pages#error'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :forms do
    resources :questions, only: [:index, :new, :create]
    get '/feedback', to: 'answers#new'
    post '/feedback', to: 'answers#create'
  end
end
