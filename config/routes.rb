Rails.application.routes.draw do

  root 'snippets#index'
  resources :snippets

  get 'tags/:tag', to: 'snippets#index', as: :tag
end
