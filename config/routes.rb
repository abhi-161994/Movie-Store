Rails.application.routes.draw do
  match '/admin/movies' => 'movies#create', via: :post
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'movies/detail' => 'movies#detail',as: :movies_detail
  resources :movies,:except => [:new,:delete,:edit,:update] do
    resources :comments
  end
    root to: "movies#index"
  #root to: "home#index"
#   devise_scope :user do
#   delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
# end

end
