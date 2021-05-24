Rails.application.routes.draw do

 devise_for :users, controllers: {   registrations: 'users/registrations',
                                    sessions: 'users/sessions' }

  resources :users, only:[:index,:new,:create,:show,:edit,:update,:destroy]
  resources :books, only:[:index,:create,:show,:edit,:destroy]
  root to: 'homes#top'
  get 'home/about' => 'homes#about',as:'home_about'

end
