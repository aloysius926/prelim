Prelims::Application.routes.draw do
  root :to => "questions#index"
  resources :questions do 
    resources :sittings
    resources :question_ratings
  end
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
end
