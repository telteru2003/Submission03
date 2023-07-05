class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:user][:name]) # ユーザー名を使用してユーザーを検索

    if user && user.valid_password?(params[:user][:password]) # ユーザーが存在し、パスワードが正しい場合
      sign_in(user) # ユーザーをログイン状態にする（Deviseのメソッド）
      redirect_to books_path, notice: 'ログインに成功しました。'
    else
      redirect_to top_path, alert: 'ログインに失敗しました。'
    end
  end
end
