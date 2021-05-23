Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => 'homes#about',as:'home_about'
  resources :users, only:[:index,:new,:create,:show,:edit,:update,:destroy]
  resources :books, only:[:create,:index,:show,:destroy]

end
