Rails.application.routes.draw do
  devise_for :users
  root 'timelines#index'
  resources :timelines, only: [:index, :show, :edit, :update] do
    member do
      post :create_post
      get :friends
      put :add_friend
      delete :delete_friend
    end
  end

  resources :searches, only: [:index]
  resources :chats, only: [:index, :show] do
    collection do
      get :ping
      get :update_sidebar_2
    end
    member do
      get :update_sidebar
      post :send_message
    end
  end
end
