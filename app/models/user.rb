class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options on: :create do
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'は半角英数字混合で入力してください'
    validates :password, length: { minimum: 6 }
  end

  with_options presence: true do
    validates :nickname, length: {maximum: 8}
    validates :first_name
    validates :last_name
  end
end
