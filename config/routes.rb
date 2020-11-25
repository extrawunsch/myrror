Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :forms do
    resources :questions, only: [:index, :new, :create, :show] do
      member do
        get :answers
      end
    end
  end
end
# forms/:id/:question_id/answers
