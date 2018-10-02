Rails.application.routes.draw do

  # below are the generated controllers and helps set up all the urls needed for this
  resources :reviews

  # conventional means of setting up root
  root "reviews#index"

end
