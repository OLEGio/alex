Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'

  get '/contacts' => 'home#contacts'

  resources :users

  resources :grades

  resources :worked_times

  resources :personal_numbers

  resources :reports, only: :index do
    collection do
      post :result
    end
  end

  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      resources :users do
        resources :contacts
      end
      resources :grades
      resources :personal_numbers
      resources :worked_times
      resources :companies do
        resources :contacts
      end

      post '/result/:user_id' => 'reports#result'
      post '/result_total' => 'reports#result_total'
      post '/lol' => 'reports#lol'
    end
  end
end
