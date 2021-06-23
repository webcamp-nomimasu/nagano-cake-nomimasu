class Contact < ApplicationRecord
  
  validates :name, presence: true
  validates :email, presence: true
  validates :name, presence: true
  validates :phone_number, presence: true
  validates :subject, presence: true
  validates :message, presence: true
  
end
