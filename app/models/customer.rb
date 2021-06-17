class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :addresses, dependent: :destroy
        
  validates :family_name,  presence: true
  validates :given_name, presence: true
  validates :kana_family_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :kana_given_name, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :address, presence: true
  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/ }
  validates :phone_number, presence: true, format: { with: /\A\d{10,11}\z/ }
  
end
