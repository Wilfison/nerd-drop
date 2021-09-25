# frozen_string_literal: true

# main scrapers
class Scraper
  SCRAPERS = [Scrapers::JovemNerd].freeze

  def initialize(scrapers = [])
    @scrapers = scrapers.present? ? scrapers : SCRAPERS
  end

  def run
    @scrapers.each(&:run)
  end

  def self.run
    SCRAPERS.each(&:run)
  end
end
