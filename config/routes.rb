Prelims::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "questions#index"
  resources :questions do 
    resources :sittings
    resources :question_ratings
    
    resources :answers do
      resources :answer_ratings
    end
  end
  resources :finished_questions
  resources :answers do
    resources :answer_ratings
  end
  resources :users
  resources :tags
  resources :sessions, only: [:new, :create, :destroy]
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'user_sessions#new',         via: 'get'
  match '/signout', to: 'user_sessions#destroy',     via: 'delete'
  match '/help' => 'static#help', via: 'get'
  #get 'questions/:question_id/answers/:id/answer_ratings/new', :to => 'answer_ratings#new', :as => :answer_id 
end