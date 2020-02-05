Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#最初のページ
  root 'books#index'
  resources :books, only: [:new, :create, :index, :show]
end
