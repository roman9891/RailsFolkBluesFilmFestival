Rails.application.routes.draw do
  #this restricted to admin only. users can go to movie/index where we will do a conditional save
  get '/movies/status/:status', to: "movies#status", as: 'movie_status'
  get '/movies/premier', to: 'welcome#premier', as: "premier"
  
  resources :showings do
  resources :comments, only: [:index, :create, :destroy]
end
  resources :movies
  resources :users
  get '/', to: 'welcome#welcome', as: 'welcome'
  get '/login', to: 'welcome#login', as: 'login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
