Rails.application.routes.draw do
  resources :users
  root "v1/users#index"

  namespace :v1 do
    defaults format: :json do
      resources :users do
        resources :records, only: [:index, :update, :create]
        post 'clockin', to: 'records#create'
        post 'clockout', to: 'records#update'
        get 'friends', to: 'users#friends'
      end

      post 'follow', to: 'follows#create'
      post 'unfollow', to: 'follows#destroy'
    end
  end
end
