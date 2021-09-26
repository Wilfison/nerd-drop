class Post < ApplicationRecord
  belongs_to :category

  scope :by_category, ->(category) { where(category: category) }
  scope :recents, ->(number) { order(id: :desc).limit(number) }
end
