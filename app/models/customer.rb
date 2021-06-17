class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy


# 全角カタカナと長音符を防ぐバリデーション
 KATAKANA_REGEXP = /\A[\p{katakana}\u{30fc}]+\z/
# 半角数字でマッチさせるバリデーション
 NUMBER_REGEXP = /\A[0-9]+\z/


 validates :family_name, presence: true
 validates :given_name, presence: true
 validates :kana_family_name, presence: true, format: { with: KATAKANA_REGEXP }
 validates :kana_family_name, presence: true, format: { with: KATAKANA_REGEXP, message: "は全角カタカナのみで入力して下さい" }
 validates :email, presence: true, uniqueness: true
 validates :postal_code, presence: true, format: { with: NUMBER_REGEXP }
 validates :address, presence: true
 validates :phone_number, presence: true, format: { with: NUMBER_REGEXP }


end
