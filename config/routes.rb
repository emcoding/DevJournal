Rails.application.routes.draw do

  root 'snippets#index'
  get 'home', to: 'pages#home'

  devise_for :accounts, controllers: {registrations: 'accounts/registrations'}

  resources :snippets

  get 'tags/:tag', to: 'snippets#index', as: :tag
end
