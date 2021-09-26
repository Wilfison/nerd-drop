# frozen_string_literal: true

module Scrapers
  # jovemnerd.com.br scrapers
  class IntoxiAnimes
    def self.run
      html = HTTParty.get('https://www.intoxianime.com')
      doc = Nokogiri::HTML(html)

      create_posts(doc.css('#grid-wrapper').first.css('.group.post'))
    end

    def self.create_posts(card_posts)
      card_posts.each do |card|
        post = Post.new

        post.category = find_category(card.css('.post-category').first.text)
        next if post.category.blank?

        a_link = card.css('.post-title a').first
        post.link = a_link.attribute('href').value
        post.title = a_link.text

        post.cover_link = cover_link(card.css('.post-thumbnail img').first.attribute('src').value)
        post.origin = 'intoxi_animes'

        post.save!
      rescue StandardError => e
        Rails.logger.info e
        next
      end
    end

    def self.find_category(category)
      category_name = category.to_s.split(' ').first

      categories = {
        'Filmes' => 'Filme',
        'Séries' => 'Série',
        'Animes' => 'Anime',
        'notícias' => 'Anime',
        'Compras' => 'Mangás e HQs',
        'Ranking' => 'Mangás e HQs'
      }

      Category.find_by(name: categories[category_name])
    end

    def self.cover_link(link)
      link.to_s.sub('-520x245', '')
    end
  end
end
