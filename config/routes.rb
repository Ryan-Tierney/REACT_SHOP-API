Rails.application.routes.draw do
  resources :users do 
    resources :suggestions
  end 
  resources :suggestions 

  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end 
