Rails.application.routes.draw do
  resources :users
  root "v1/users#index"

  namespace :v1 do
    defaults format: :json do
      resources :users do
        resources :records, only: [:index, :update, :create], path_names: { create: 'clockin', update: 'clockout' }
      end
    end
  end
end
