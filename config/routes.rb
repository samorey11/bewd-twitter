Rails.application.routes.draw do
  root 'homepage#index'
  get '/feeds' => 'feeds#index'
  get '/users' => 'users#index'
  get '/tweets' => 'tweets#index'

  # USERS
  post '/users' => 'users#create'

  # SESSIONS
  post '/sessions' => 'sessions#create'
  get '/authenticated' => 'sessions#authenticated'
  delete '/sessions' => 'sessions#destroy'

  # TWEETS
  post '/tweets' => 'tweets#create'
  delete '/tweets/:id' => 'tweets#destroy'

  # Redirect all other paths to index page, which will be taken over by AngularJS
  get '*path' => 'homepage#index'
end
