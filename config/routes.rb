Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  # below are the generated controllers and helps set up all the urls needed for this
  resources :reviews do
    resources :comments

    # can only do one thing 
    resource :bookmark

  end

  # 
  resources :users

  #
  resource :session

  # get just pulls the page
  get "about", to: "pages#about"

  get "terms", to: "pages#terms"

  get "home", to: "pages#home"

  # conventional means of setting up root
  root "reviews#index"

end
