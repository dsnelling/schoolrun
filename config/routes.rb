Schoolrun::Application.routes.draw do

  get "admin" => "admin#index"

  controller :sessions do
    get "login" => :new
    post "login" => :create
    get "logout" => :destroy
  end

  resources :users

  resources :events
  resources :occupants, :except => :index
  resources :drivers, :except => :index

  root to: 'events#index', as: 'events'

end
