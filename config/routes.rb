Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  concern :api_base do
    get '/index' => 'home#index'
    get '/auth' => 'home#auth'
    post '/sign_in' => 'user_token#create'
    scope controller: :complains do
            post '/complain/create/' => :create
            patch '/complain/:id' => :update
            delete '/complain/:id' => :destroy
            get '/complains' => 'complains#index'
            get 'complain/:id' => 'complains#show'
    end
    scope controller: :users do
      post '/sign_up' => :create
      get '/users/:id' => :show
      patch '/users/:id' => :update
      delete '/users/:id' => :destroy
    end
    namespace :admin do
      get '/users' => 'dashboard#index'
    end
  end

  namespace :api do
    namespace :v1 do
      concerns :api_base
    end
  end

  #  versionamiento posible version 2 (crear namespace vN..)
  #  https://chriskottom.com/blog/2017/04/versioning-a-rails-api/
  #  namespace :api do
  #    namespace :v2 do
  #      concerns :api_base
  #    end
  #  end

  #posible "/"
  #root to: 'api/v1/home#index'

  #rutas no encontradas
  match '*unmatched_route', :to => 'api/v1/errors#routing', via: [:all]
end
