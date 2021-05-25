Rails.application.routes.draw do

 devise_for :users, controllers: {   registrations: 'users/registrations',
                                    sessions: 'users/sessions' }
  resources :users
  resources :books

  root to: 'homes#top'
  get 'home/about' => 'homes#about',as:'home_about'

end
