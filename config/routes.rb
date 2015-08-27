Rails.application.routes.draw do
  root :to => 'games#index'

  resources :cards do
    member do
      get 'draw', to: 'cards#draw'
      get 'color', to: 'cards#color'
    end
  end

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
