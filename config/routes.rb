Rails.application.routes.draw do

  resources :movies
  root to: 'movies#index'

  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'

end
