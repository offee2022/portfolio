class Game < ApplicationRecord
  attachment :image
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 300 }
end
