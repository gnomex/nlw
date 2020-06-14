Rails.application.routes.draw do
  namespace :api,  defaults: { format: :json } do
    resources :items
    resources :points
  end
end
