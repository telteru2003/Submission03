class Book < ApplicationRecord

# アプリケーションを完成させよう / 6章 / モデルに記述を追加する
# アプリケーションを完成させよう2  / 8章 / モデル・テーブルの作成
  has_one_attached :image

# アプリケーションを完成させよう2  / 9章 / モデル同士の関連付け(アソシエーション)を理解しよう
  belongs_to :user

# アプリケーションを完成させよう / 8章【バリデーションの設定】
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 200 }
end
