class Genre < ApplicationRecord
  has_many :items, dependent: :destroy
  
  validates :name, presence: true
  
  def Genre.search(word)
    Genre.where(name: "#{word}")
  end
end