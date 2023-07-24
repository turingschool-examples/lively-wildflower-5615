Rails.application.routes.draw do
  # Defines the root path route ("/")
  # root "articles#index"

  get "/guest/:id", to: "guests#show", as: :guest

  post "/guest/:id/add_room", to: "guest_rooms#create", as: :add_guest_room

  get "/rooms", to: "rooms#index", as: :rooms

  get "/hotels/:id", to: "hotels#show", as: :hotel

end
