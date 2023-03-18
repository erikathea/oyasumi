Rails.application.routes.draw do
  resources :users
  root "v1/users#index"

  namespace :v1 do
    defaults format: :json do
      resources :users
    end
  end
end
