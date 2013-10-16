Travelpoker::Application.routes.draw do

  resources :decks do
    resources :likes, only: [:create, :destroy]
  end
  resources :cards do 
    resources :likes, only: [:create, :destroy]
    resources :comments do
      match '/up-vote', to: 'votes#up_vote', as: :up_vote
      match '/down-vote', to: 'votes#down_vote', as: :down_vote
    end
  end
      
  resources :users, only: [:show, :index] do
    resources :cards, only: [:index]
    resources :decks, only: [:index]
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  match "about" => 'welcome#about', via: :get

  root :to => 'welcome#index'
end
