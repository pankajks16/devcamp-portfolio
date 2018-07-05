Rails.application.routes.draw do
  root to: 'blogs#index'
  
  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'angular-items', to: 'portfolios#angular'
  get 'ror-items', to: 'portfolios#ror'

  resources :portfolios, except: [:show]  # except option excludes the generation of 
  										  # natural routes for the passed value in array.
  resources :blogs do 
    member do
      get 'portfolio_status'   # learn more on: http://guides.rubyonrails.org/routing.html#adding-member-routes
    end
  end

  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'	# we overriden the general route for show action 

  # get 'pages/home'

  # get 'pages/contact'

  # get 'pages/about'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
