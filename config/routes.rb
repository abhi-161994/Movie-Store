Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'movies/detail' => 'movies#detail',as: :movies_detail
  resources :movies
  root to: "movies#index"
end
