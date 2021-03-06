Rails.application.routes.draw do
  get 'users/show'
  # devise_for :users
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    delete "sign_out", :to => "users/sessions#destroy"
    post "users/gest_sign_in" => "users/sessions#new_gest"
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'places#index'
  resources :places do
    resources :reviews
  end
  resources :users, :only => [:show]

  resources :place_areas, only: [:index, :show]
end
