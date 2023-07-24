Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "guest/:id", to: "guests#show"
  post "guest/:id/add_room", to: "guests#add_room"
  


end
