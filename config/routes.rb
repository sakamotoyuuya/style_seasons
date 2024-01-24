Rails.application.routes.draw do

  devise_for :users,skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}
# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

 namespace :admin do
    get "/" => "cordinates#index"
    get "cordinate/search" => "cordinates#search"
    resources :cordinates,only: [:index,:new,:create,:show,:edit,:update]
    # resources :likes,only: [:show,:update]
    # resources :reviews,only: [:show,:update]
    resources :users,only: [:index,:show,:edit,:update]
    resources :seasons,only: [:index,:create,:edit,:update]
    resources :items, only: [:index,:new,:create,:show,:edit,:update] do

    end
  end
  scope module: :users do
    root to: 'cordinates#index'
    get "cordinate/search" => "cordinates#search"
    resources :cordinates, only: [:index, :show]
    resources :items, only: [:index]
    resources :items, only: [:edit, :show, :update]


  end

end
