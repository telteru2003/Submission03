# アプリケーションを完成させよう2 / 10章 / 投稿画面
class BooksController < ApplicationController
# アプリケーションを完成させよう2 / 他のユーザーからのアクセスを制限しよう
  before_action :is_matching_login_user, only: [:edit, :update]

# アプリケーションを完成させよう / 3章/ コントローラにindexアクションを追加する
  def index
    @book = Book.new
    @books = Book.all
  end

# アプリケーションを完成させよう2 / 10章 / 登録機能
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @books = Book.new
    if @book.save
      flash[:notice] = 'You have created book successfully.'
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

# アプリケーションを完成させよう / 5章【編集機能を作ろう】
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    flash[:notice] = 'You have updated book successfully.'
    redirect_to book_path(@book.id)
    else
      book = Book.all
      render :edit
    end
  end

# アプリケーションを完成させよう2 / 13章【投稿機能の作成(6) - 投稿を削除できるようにしよう】
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def is_matching_login_user
    book = Book.find(params[:id])
    unless book.id == current_user.id
      redirect_to books_path
    end
  end
end
