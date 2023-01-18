Rails.application.routes.draw do
  
  devise_for :users
  root to: 'homes#top'
  get '/home/about'=> 'homes#about'
  get 'user'=> 'users#show'
  resources :books, only:[:new,:show,:index,:edit,:destroy,:create,:update]
  resources :users, only:[:show,:edit]

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
