AngularRailsHacking::Application.routes.draw do

  # using devise for demo
  devise_for :users

  # root
  root :to => 'home#index'

  # user root is the dashboard
  match 'dashboard' => 'dashboard#index', :as => :user_root

  # the photo album is a single page app in angular so this route matches the angular route back to the start of the photo albums single page
  match '/user/:user_id/album/:album_id/photos' => 'users/albums#index'

  # bunch of normal resources
  resources :users do
    resources :albums, module: :users do
      resources :photos
    end
  end
end
