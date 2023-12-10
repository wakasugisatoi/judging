Rails.application.routes.draw do
  
  devise_for :users, skip: [:passwords], controllers: {
    registrations:"public/registrations",
    sessions: 'public/sessions'
  }
  
  scope module: :public do 
    root 'homes#top'
    get 'about' => 'homes#about', as: 'about'
    resources :judges, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
      resources :judge_comments, only: [:create, :destroy]
    end
    resources :users, only: [:update] do
      get 'mypage'=> 'users#show'
      get 'information/edit' => 'users#edit'
    end 
    resources :histories, only: [:index]
    resources :comedians, only: [:index]
  end 
  
  
  devise_for :admin,skip:[:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    get 'homes/top'
  
    resources :finalists, only: [:index, :show, :new, :create, :edit, :update]
    resources :judges, only: [:index, :destroy]
    resources :users, only: [:index, :show, :destroy]
  end
  
  #ログアウトでルーティングエラーが出るので以下を記述
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  
  devise_scope :admin do
    get '/admin/sign_out' => 'devise/sessions#destroy'
  end
  
end
