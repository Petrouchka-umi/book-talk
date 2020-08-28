class Message < ApplicationRecord
  belongs_to :user, optional: true
  has_many :comments

  validates :title, presence: true
  validates :name, presence: true
  validates :text, presence: true, length: {maximum: 200}

  mount_uploader :image, ImageUploader

  def self.search(title)
    if title != ""
      Message.where('title LIKE(?)', "%#{title}%")
    else
      Message.all
    end
  end
end
