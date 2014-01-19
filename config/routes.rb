Travelpoker::Application.routes.draw do

  resources :create_slug_for_decks


  resources :create_slug_for_cards


  resource :cards_decks, only: [:create, :destroy]

  resources :decks do
    collection do
      get :search
    end
    resources :likes, only: [:create, :destroy]
    resources :dones, only: [:create, :destroy]
    member do
      post :copy
    end
  end

  resources :decks
    match '/feed' => 'decks#feed',
      :as => :feed,
      :defaults => { :format => 'atom' }
  
  resources :cards do 
    resources :likes, only: [:create, :destroy]
    resources :dones, only: [:create, :destroy]
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
  match "how" => 'welcome#how', via: :get
  match "blog" => 'welcome#blog', via: :get
  match "faq" => 'welcome#faq', via: :get
  match "privacy" => 'welcome#privacy', via: :get
  match "terms" => 'welcome#terms', via: :get
  match "contact" => 'welcome#contact', via: :get
  match "sitemap" => 'welcome#sitemap', via: :get

  root :to => 'welcome#index'
end
