class Post < ApplicationRecord
  belongs_to :user
  validates :url, presence: true
  validates :description, presence: true
end
