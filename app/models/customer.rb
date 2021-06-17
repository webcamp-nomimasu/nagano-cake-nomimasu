class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  
  
  
  
  validates :family_name,  presence: true
  validates :given_name, presence: true
  validates :kana_family_name, presence: true
  validates :kana_given_name, presence: true
  validates :address, presence: true
  validates :postal_code, presence: true
  validates :phone_number, presence: true
end
