# frozen_string_literal: true

module Scrapers
  # jovemnerd.com.br scrapers
  class JovemNerd
    include HTTParty

    base_uri 'jovemnerd.com.br'

    def self.run
      html = get('/nerdbunker')
      doc = Nokogiri::HTML(html)

      create_posts(doc.css('.card-post'))
      create_posts(doc.css('.main-highlights article'))
    end

    def self.create_posts(card_posts)
      card_posts.each do |card|
        post = Post.new

        infos_div = card.css('.info').first
        post.category = find_category(infos_div.css('a').first.text)
        next if post.category.blank?

        a_link = card.css('a').first
        post.link = a_link.attribute('href').value
        post.cover_link = a_link.css('img').first.attribute('src').value

        post.title = infos_div.css('.title a').first.text
        post.origin = 'jovem_nerd'
        post.description = nil

        post.save
      rescue StandardError => e
        Rails.logger.info e
        next
      end
    end

    def self.find_category(category_name)
      categories = {
        'Filmes' => 'Filme',
        'Séries e TV' => 'Série',
        'Animes e Mangás' => 'Anime',
        'Games' => 'Games',
        'HQs e Livros' => 'Mangás e HQs'
      }

      Category.find_by(name: categories[category_name])
    end
  end
end
