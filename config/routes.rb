Rails.application.routes.draw do
  
  devise_for :users, skip: [:passwords], controllers: {
    registrations:"public/registrations",
    sessions: 'public/sessions'
  }
  
  scope module: :public do 
    root 'homes#top'
    get 'about' => 'homes#about', as: 'about'
    
    resources :judges, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      post 'search_comedians', to: 'judges#search_comedians'

      resource :favorites, only: [:create, :destroy]
      resources :judge_comments, only: [:create, :destroy]
    end
    
    resources :users, only: [:update] do
      get 'mypage', on: :member, to: 'users#show', as: 'mypage'
      get 'information/edit', on: :member, to: 'users#edit', as: 'edit_information'
    end
    
    resources :histories, only: [:index] do
      get 'comedians', on: :member, to: 'histories#index_comedians', as: 'comedians'
    end
    
      get 'comedian/:id/judges' => 'comedians#judge', as: 'comedian_judge'
  end 
  
  
  devise_for :admin,skip:[:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  namespace :admin do
    get 'homes/top'
    
    resources :finalists, only: [:index, :show, :new, :create, :edit, :update]
    resources :judges, only: [:index, :destroy]
    resources :users, only: [:index, :show] do
      member do
        patch :is_active
      end
    end
  end
  
  #ログアウトでルーティングエラーが出るので以下を記述
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    post '/users/guest/guest_sign_in', to: 'public/sessions#guest_sign_in' #ゲストログイン
  end
  
  devise_scope :admin do
    get '/admin/sign_out' => 'devise/sessions#destroy'
  end
  
end
