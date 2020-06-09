Rails.application.routes.draw do
  namespace :api,  defaults: { format: :json } do
    resources :items do
      get :image, on: :member
    end
  end
end
