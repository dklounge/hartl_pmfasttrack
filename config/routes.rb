SampleApp::Application.routes.draw do

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  root to: 'static_pages#home'

  match '/signup', to: "users#new", via: 'get'
  match '/signin', to: 'session#new', via: 'get'
  match '/signout', to: 'session#destroy', via: 'delete'
  match '/home', to: "static_pages#home", via: 'get'
  match '/events', to: "static_pages#events", via: 'get'
  match '/about', to: "static_pages#about", via: 'get'
  match '/contact', to: "static_pages#contact", via: 'get'

end
