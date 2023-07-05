Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'

# アプリケーションを完成させよう / 5章【編集機能を作ろう】
  patch 'books/:id' => 'books#update', as: 'update_book'
  patch 'users/:id' => 'users#update', as: 'update_user'

# アプリケーションを完成させよう / 7章【削除機能を作ろう】
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'

# アプリケーションを完成させよう2 / 7章 / Aboutページの作成
  get "homes/about" => "homes#about", as: "about"

# アプリケーションを完成させよう2 / 9章 / ルーティング / resources とは
# アプリケーションを完成させよう2 / 14章 / ユーザーに関する機能(1) - 準備編 / Routing
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
end