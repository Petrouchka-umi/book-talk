class Message < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :text, presence: true

  mount_uploader :image, ImageUploader
end
