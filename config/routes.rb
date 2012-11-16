Schoolrun::Application.routes.draw do

  root to: 'events#index'
  #get "admin" => "admin#index"
  #get "about" => "admin#about"

  controller :admin do
    get "admin" => :index
    get "about" => :about
    get "news" => :news
  end
  controller :sessions do
    get "login" => :new
    post "login" => :create
    get "logout" => :destroy
  end

  resources :password_resets
  resources :users

  resources :events do
    collection do
      get :purge
    end
  end 
  resources :occupants, :except => :index
  resources :drivers, :except => :index
  resource :import, :only => [:new, :create, :show]

end
