Rails.application.routes.draw do
  #this restricted to admin only. users can go to movie/index where we will do a conditional save
  get '/movies/status/:status', to: "movies#status", as: 'movie_status'
  get '/movies/premier', to: 'welcome#premier', as: "premier"
  resources :comments, only: [:new, :index, :create, :destroy]
  resources :showings
  resources :movies
  resources :users
  get '/', to: 'welcome#welcome', as: 'welcome'
  get '/login', to: 'welcome#login', as: 'login'
  post '/login', to: 'welcome#create', as: 'new_login'
  delete '/login', to: 'welcome#destroy', as: 'delete_login'
  get '/unauthorized', to: 'welcome#unauthorized', as: 'unauthorized'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
