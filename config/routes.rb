Rails.application.routes.draw do
  devise_for :users
  root 'users#index' 
  resources :users, only: [:index, :show] do
    resources :posts do
      resources :comments
      resources :likes
    end
  end
  delete '/users/:user_id/posts/:id', to: 'posts#destroy', as: 'delete_user_post'
  delete '/users/:user_id/posts/:post_id/comments/:id', to: 'comments#destroy', as: 'delete_user_post_comment'
end
