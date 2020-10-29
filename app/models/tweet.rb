class Tweet < ApplicationRecord
  validates :content, presence: { message: 'をちゃんとかいてね' },
             length: { maximum: 140 }
end
