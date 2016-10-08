Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show, :edit, :update]
  resource :session, except: [:show, :index, :edit, :update]
  resources :subs, except: :destroy do
    resources :posts, only: [:new, :create]
  end
  resources :posts, only: [:edit, :update, :show, :destroy]
end
