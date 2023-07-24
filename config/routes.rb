Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/guests/:guest_id", to: "guests#show"
  post "/guests/:guest_id/add_room", to: "guests#add_room", as: :add_room_to_guest
  
  get "/rooms", to: "rooms#index"
end
