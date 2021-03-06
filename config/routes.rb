Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users, only: [:show, :edit, :update]

  resources :posts  do
    resources :likes
    resources :comments

  end

  post '/posts/:post_id/comments(.:format)' => 'comments#create', as: :post_comments_new
  post '/posts/:post_id/likes(.:format)' => 'likes#create', as: :post_likes_new
  post '/users/:user_id/follow(.:format)' => 'main#follow', as: :follow_user
  post '/users/:user_id/unfollow(.:format)' => 'main#unfollow', as: :unfollow_user

  get "profile" => "main#profile"
  get "feed" => "main#index"

  get "followees" => "main#followees"

  root "main#index"

end
