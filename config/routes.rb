Prelims::Application.routes.draw do
  get 'password_resets/new'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root to: 'questions#index'
  resources :questions do
    resources :sittings
    resources :question_ratings
    collection { post :search, to: 'questions#index' }

    resources :answers do
      resources :answer_ratings
    end
  end
  resources :password_resets
  resources :questiontags
  resources :finished_questions
  resources :answers do
    resources :answer_ratings
  end
  resources :users
  resources :tags
  resources :user_sessions, only: [:new, :create, :destroy]
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'user_sessions#new',         via: 'get'
  match '/signout', to: 'user_sessions#destroy',     via: 'delete'
  match '/help' => 'static#help', via: 'get'
  match '/summary' => 'static#summary', via: 'get'
end
