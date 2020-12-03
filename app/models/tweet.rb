class Tweet < ApplicationRecord
  validates :content, presence: { message: 'をちゃんとかいてね' },
             length: { maximum: 140 }
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
