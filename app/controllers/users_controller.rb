class UsersController < ApplicationController
# アプリケーションを完成させよう2 / 他のユーザーからのアクセスを制限しよう
  before_action :is_matching_login_user, only: [:edit, :update]

# アプリケーションを完成させよう2 / 10章 / 投稿画面 / Controller
# アプリケーションを完成させよう2 / 15章 / Controller

  def index
    @users = User.all
    @books = Book.where(user_id: @users.pluck(:id))
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'You have updated user successfully.'
      redirect_to user_path(@user.id)
    else
      user = User.all
      render :edit
    end
  end


  def destroy
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def set_default_profile_image
    unless profile_image.attached?
      default_image_path = Rails.root.join('app', 'assets', 'images', 'default-image')
      profile_image.attach(io: File.open(default_image_path), filename: 'default-image', content_type: 'image/jpeg')
    end
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end

end