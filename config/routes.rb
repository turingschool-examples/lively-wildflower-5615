Rails.application.routes.draw do
  get "/guests/:id", to: "guests#show"
  post "/guests/:id", to: "guest_rooms#create"
  get "/rooms", to: "rooms#index"
  get "/hotels/:id", to: "hotels#show"
end
