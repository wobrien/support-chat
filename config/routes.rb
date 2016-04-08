Rails.application.routes.draw do

  namespace :team do
    resource :session

    resources :chats do
      member do
        patch 'grap', to: 'chats#take'
        patch 'close', to: 'chats#close'
      end
      resources :comments
    end
  end
  
  resources :chats do
    member do
      get 'email', to: 'chats#xxxxemail'
    end
    resources :comments
  end

  root 'team/chats#index'
end
