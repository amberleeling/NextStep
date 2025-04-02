Rails.application.routes.draw do
  devise_for :users
  root to: "dashboards#show"

  resource :dashboard, only: [:show]

  resources :jobs, only: [:index, :show] do
    member do
      get 'cover_letter', to: 'cover_letters#show'
      post 'applications', to: 'applications#create'
    end
    resources :cover_letters, only: [:create]
  end

  resources :applications, only: [:index, :new, :create, :edit, :update, :destroy]

  get '/cover_letter', to: 'cover_letters#show', as: :cover_letter
  post '/cover_letters', to: 'cover_letters#create'

  get "webmanifest"    => "pwa#manifest"
  get "service-worker" => "pwa#service_worker"
end
