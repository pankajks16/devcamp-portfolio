Rails.application.routes.draw do
  root to: 'portfolios#index'
  
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :portfolios
  resources :blogs
  # get 'pages/home'

  # get 'pages/contact'

  # get 'pages/about'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
