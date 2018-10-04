Rails.application.routes.draw do

  # below are the generated controllers and helps set up all the urls needed for this
  resources :reviews do
    resources :comments
  end

  # 
  resources :users

  # conventional means of setting up root
  root "reviews#index"

end
