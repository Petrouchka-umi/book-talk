class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :message

  validates :text, presence: true, length: {maximum: 30}
end
