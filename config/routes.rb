Rails.application.routes.draw do

  devise_for :users, controllers: {
  registrations: "users/registrations",
  sessions: 'users/sessions',
  passwords: 'users/passwords'
}
# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

 namespace :admin do
    get "/" => "cordinates#index"
    get "cordinate/search" => "cordinates#search"
    resources :cordinates,only: [:index,:new,:create,:show,:edit,:update, :destroy]
    patch 'users/unsubscribe' => "users#unsubscribe"
    resources :users,only: [:index,:show,:edit,:update]
    resources :seasons,only: [:index,:create,:edit,:update]
    resources :items, only: [:index,:new,:create,:show,:edit,:update, :destroy] do

    end
  end
  scope module: :users do
    root to: 'cordinates#index'
    get "cordinate/search" => "cordinates#search"
    resources :cordinates, only: [:index, :show] do
      resource :likes, only: [:create, :destroy]
    end
    get "cordinate/:id/items", to: "items#index", as: "items"
    get "users/show" => "users#show"
    get "users/information/edit" => "users#edit"
    patch "users/information" => "users#update"
    patch 'users/unsubscribe' => "users#unsubscribe"
    get 'users/withdraw' => "users#withdraw"
    get 'users/likes' => "users#likes"

  end

end
