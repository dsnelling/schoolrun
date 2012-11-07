Schoolrun::Application.routes.draw do

  root to: 'events#index'
  get "admin" => "admin#index"
  get "about" => "admin#about"

  controller :sessions do
    get "login" => :new
    post "login" => :create
    get "logout" => :destroy
  end

  resources :users

  resources :events
  resources :occupants, :except => :index
  resources :drivers, :except => :index
  resource :import, :only => [:new, :create, :show]

end
