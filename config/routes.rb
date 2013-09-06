Mczach::Application.routes.draw do
  root :to => 'applications#index'

  namespace :api do
    namespace :logs do
      post 'log'
    end
  end

  resources :applications, only: %w[index] do
    resource :report, only: %w[show]
  end
end
