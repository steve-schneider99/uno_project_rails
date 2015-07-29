Rails.application.routes.draw do
  root :to => 'games#index'

  resources :games do
    resources :players
    resources :cards
    member do
      get 'reset', to: 'games#reset'
    end
  end

  resources :players do
    resources :cards
  end

end
