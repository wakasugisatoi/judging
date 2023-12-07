Rails.application.routes.draw do
  namespace :admin do
    get 'judges/index'
    get 'judges/destroy'
  end
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/destroy'
  end
  namespace :admin do
    get 'finalists/index'
    get 'finalists/new'
    get 'finalists/create'
    get 'finalists/show'
    get 'finalists/edit'
    get 'finalists/update'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'comedians/index'
  end
  namespace :public do
    get 'histories/index'
  end
  namespace :public do
    get 'users/show'
    get 'users/edit'
    get 'users/update'
  end
  namespace :public do
    get 'judge_comments/create'
    get 'judge_comments/destroy'
  end
  namespace :public do
    get 'favorite/create'
    get 'favorite/destroy'
  end
  namespace :public do
    get 'judges/new'
    get 'judges/create'
    get 'judges/show'
    get 'judges/edit'
    get 'judges/update'
    get 'judges/destroy'
  end
  namespace :public do
    get 'homes/top'
  end
  #ユーザー用
  #URL/user/sign_in...
  devise_for :users,skip: [:passwords], controllers: {
    registrations:"public/registrations",
    sessions: 'public/sessions'
  }
  #管理者用
  #URL/admin/sign_in/...
  devise_for :admin,skip:[:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
