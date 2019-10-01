Rails.application.routes.draw do
  namespace :admin do
    resources :dashboard, only: :index
  end

  namespace :api do
    namespace :v1 do
      # get 'test_api', to: 'test#index'
      get 'garbages/nearest', to: 'garbages#nearest'
    end
  end
end
