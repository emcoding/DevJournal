Rails.application.routes.draw do

  devise_for :accounts

  root 'snippets#index'
  resources :snippets

  get 'tags/:tag', to: 'snippets#index', as: :tag
end
