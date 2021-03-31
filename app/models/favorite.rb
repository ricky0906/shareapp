class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :message
  # 同じ投稿を複数回お気に入り登録させないため
  validates_uniqueness_of :message_id, scope: :user_id # バリデーション（ユーザーとメッセージの組み合わせ
end
