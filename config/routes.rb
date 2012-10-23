SampleApp::Application.routes.draw do
  resources :users do
    resources :microposts, :only => [:index]
  end

  resources :microposts, :only => [:create, :destroy]
  resources :sessions, :only => [:new, :create, :destroy]
  
  match '/signup', :to => 'users#new'
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'

  get '/contact', :to => 'pages#contact'
  get '/about', :to => 'pages#about'
  get '/help', :to => 'pages#help'

  root :to => 'pages#home'

end
