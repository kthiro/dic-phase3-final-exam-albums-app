Rails.application.routes.draw do

  resources :albums do
    collection do
      post :confirm
    end
  end
  
  resources :users, only: [:new, :create, :show] do
    collection do
      post :confirm
    end
  end
  
  resources :sessions, only: [:new, :create, :destroy]
  
  resources :favorites, only: [:create, :destroy]
  
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
  resources :tops, only: [:index]
  
end
