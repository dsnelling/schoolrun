Schoolrun::Application.routes.draw do

  resources :event_comments


  root to: 'events#index'
  #get "admin" => "admin#index"
  #get "about" => "admin#about"

  controller :admin do
    get "admin" => :index
    get "about" => :about
    get "news" => :news
    get "team_email" => :team_email
    post "team_email" => :send_email
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
    resources :event_comments, :except => [:show]
  end 
  resources :occupants, :except => :index
  resources :drivers, :except => :index
  resource :import, :only => [:new, :create, :show]

end
