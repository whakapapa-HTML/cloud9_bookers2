Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about',as:'home_about'
  resources :users, only:[:new,:create,:index,:show,:destroy]
  resources :books, only:[:new,:create,:index,:show,:destroy]

end
