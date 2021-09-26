class Post < ApplicationRecord
  belongs_to :category

  scope :by_category, ->(category) { where(category: category) }
  scope :recents, ->(number) { order(id: :desc).limit(number) }

  validates_uniqueness_of :link, on: :create, message: 'Já existe...'
end
