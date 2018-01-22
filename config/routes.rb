Rails.application.routes.draw do
  root to: 'home#index'

  resources :posts, only: %i[new create show]
end
