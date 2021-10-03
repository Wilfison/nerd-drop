class Post < ApplicationRecord
  belongs_to :category

  scope :by_category, ->(category) { where(category: category) }
  scope :recents, ->(number) { order(id: :desc).limit(number) }

  validates_uniqueness_of :link, on: :create, message: 'Já existe...'

  def self.new_blank
    new(
      title: 'Nenhum post encontrado!',
      link: '/scraper?token=lKtT7jYxE_KX1TZmLRfGAw',
      cover_link: '/blank.png'
    )
  end
end
