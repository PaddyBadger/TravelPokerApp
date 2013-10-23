Travelpoker::Application.routes.draw do

  resource :cards_decks, only: [:create, :destroy]

  resources :decks do
    resources :likes, only: [:create, :destroy]
    member do
      post :copy
    end
  end
  
  resources :cards do 
    collection do
      get :search
    end
    resources :likes, only: [:create, :destroy]
    resources :comments do
      match '/up-vote', to: 'votes#up_vote', as: :up_vote
      match '/down-vote', to: 'votes#down_vote', as: :down_vote
    end
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
      
  resources :users, only: [:show, :index] do
    resources :cards, only: [:index], controller: 'users/cards'
    resources :decks, only: [:index], controller: 'users/decks'
  end

  match "about" => 'welcome#about', via: :get

  root :to => 'welcome#index'
end
