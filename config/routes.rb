Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}
  devise_scope :user do
    delete 'sign_out', to: 'devise/session#destroy', as: :destroy_user_session
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :comments, only: [:index, :create]
  resources :friends, only: [:index, :show]
  resources :invitations, only: [:index, :destroy]
  get '/invitations/:id/invite', to: 'invitations#invite'
  get '/invitations/:id/accept', to: 'invitation#accept'
  resources :posts, only: [:create, :new, :index, :show]
  get '/posts/:id/like', to: 'posts#like'
  resources :users, only: [:index, :show]
  # Defines the root path route ("/")
  # root "articles#index"
end
