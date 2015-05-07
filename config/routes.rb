Rails.application.routes.draw do
  root to: 'links#index'

  resources :links, only: [:create]

  get ':id', to: 'links#show', as: :slug
end