Rails.application.routes.draw do
  get 'users/edit'
  get 'users/show'
  get 'books/new'
  get 'books/show'
  get 'books/index'
  get 'books/edit'
  get 'books/destroy'
  get 'books/create'
  get 'homes/top'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
