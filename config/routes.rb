Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/feedback', to: 'pages#feedback'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :forms do
    member do # member when you want id in link
      get :success
    end

    resources :questions, only: [:index, :new, :create, :show] do
      resources :answers, only: [:index, :new, :create]
    end

  end
end
# forms/:id/:question_id/answers
