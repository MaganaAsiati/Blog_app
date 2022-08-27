Rails.application.routes.draw do
  devise_for :users,controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
  get 'comments/new'
  get 'comments/create'
  get 'likes/create'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'
  resources :users, only: [:index, :show ] do 
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
    resources :comments, only: [ :create, :destroy]
    resources :likes, only: [:create ]
  end 
end
# namespace :api, defaults: { format: :json } do
#   namespace :v1 do
#   resources :users, only: [:index] do 
#     resources :posts, only: [:index] do
#       resources :comments, only: [:index] 
#      end
#     end
#   end
#   end

namespace :api do 
  namespace :v1 do 
    resources :users, only: %i[index] do 
      resources :posts, only: %i[index show] do 
        resources :comments, only: %i[index new create ] 
      end 
    end 
  end 
end 
end
