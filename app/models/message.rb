class Message < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments

  validates :text, presence: true

  mount_uploader :image, ImageUploader

  def self.search(title)
    if title != ""
      Message.where('title LIKE(?)', "%#{title}%")
    else
      Message.all
    end
  end
end
