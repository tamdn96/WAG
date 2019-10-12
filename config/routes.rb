Rails.application.routes.draw do
  namespace :admin do
    resources :dashboard, only: :index
  end

  namespace :api do
    namespace :v1 do
      get 'test', to: 'garbages#test'
      # post 'register', to: 'registrations#create'
      # post 'login', to: 'sessions#create'
      # delete 'logout', to: 'sessions#destroy'
      get 'garbages/nearest', to: 'garbages#nearest'
      get 'garbages/show/:qrcode', to: 'garbages#show'
      post 'reports', to: 'reports#create'
      post 'events', to: 'events#create'
    end
  end
end
