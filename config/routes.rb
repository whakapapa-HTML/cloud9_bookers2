Rails.application.routes.draw do

 devise_for :users, controllers: {   registrations: 'users/registrations',
                                    sessions: 'users/sessions' }

  resources :books
  resources :users


  root to: 'homes#top'
  get '/home/about' => 'homes#about',as: 'current_user'

end
