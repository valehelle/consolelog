Rails.application.routes.draw do
  root :to => "user#landing"
  mount_devise_token_auth_for 'User', at: 'auth'
  get '/login/', to: 'user#login'
  post '/login/', to: 'user#create'
  get '/projects/', to: 'project#index'
  get '/projects/:title', to: 'project#show'
  post '/projects/create', to: 'project#create'
  post '/projects/:title/create', to: 'log#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
