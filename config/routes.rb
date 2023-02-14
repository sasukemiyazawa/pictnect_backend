Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'

      get 'posts/search_tag/:tag_id', to: 'posts#search_tag'
      resources :posts do
        get 'like', to: 'posts#like'
        get 'pickup', to: 'posts#pickup'
      end
      resources :events
      resources :tags
    end
  end

end
