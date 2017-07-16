Rails.application.routes.draw do

  root to: 'annonces#index'
  resources :annonces

  get '/profil', to: 'users#edit', as: :profil
  patch '/profil', to: 'users#update'

  get '/profil/mesannonces', to: 'users#all_annonce'

  get '/login', to: 'sessions#new', as: :new_session
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: :destroy_session

  resources :games, only: [:show]
  resources :sessions, only: [:new, :create]
  resources :users, only: [:new, :create, :show] do
      member do
        get 'confirm'
      end
  end
end
