Rails.application.routes.draw do
  root 'posts#show'
  resources :posts
  resources :users, except: [:index,:destroy,:edit]
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

end
