Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Guest
  get "guest/:id", to: "guests#show"
  post "guest/:id", to: "guest_rooms#create"
end
