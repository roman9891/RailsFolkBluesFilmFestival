Rails.application.routes.draw do
  resources :showings do
    resources :comments
  end
  resources :movies
  resources :users
  get '/', to: 'showings#welcome', as: 'welcome'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
