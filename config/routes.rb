Rails.application.routes.draw do

  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'public/posts#index'

  devise_for :campers, controllers: {
      registrations: 'public/registrations',
      sessions: 'public/sessions'
    }
  scope module: :public do

    get 'search' => 'searchs#search'

    resources :campers, only: %i(show index edit update destroy
     quit out) do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      
      member do
      get :likes
      end

    end


    resources :posts, only: %i(new create index show destroy) do
      resource :like, only: %i(create destroy)
      resources :comments, only: %i(create destroy)
      resource :photos, only: %i(create)

   end
  end
  #devise_for :admins, controllers: {
  #  sesssions: "admin/sessions"
  #}

end