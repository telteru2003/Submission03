# アプリケーションを完成させよう2 / 5章 / devise の基本操作
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:name]

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: true, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }

# アプリケーションを完成させよう2  / 9章 / モデル同士の関連付け(アソシエーション)を理解しよう
  has_many :books, dependent: :destroy

# アプリケーションを完成させよう2 / 14章 / ユーザーに関する機能(1) - 準備編 / Controller
  has_one_attached :profile_image

  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/default-image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [100,100]).processed
  end

end
