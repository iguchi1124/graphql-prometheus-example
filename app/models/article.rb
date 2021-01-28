class Article < ApplicationRecord
  belongs_to :user

  validates :slug, length: { minimum: 5, maximum: 30 }
  validates :title, length: { minimum: 5, maximum: 30 }
  validates :body, length: { minimum: 100 }
end
