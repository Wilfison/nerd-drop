class ScraperController < ApplicationController
  def index
    return redirect_to '/404.html' if token_invalid?

    Scraper.run

    render json: { status: 'ok' }, status: :ok
  end

  private

  def token_invalid?
    params[:token].blank? || params[:token] != ENV['THE_WILL_TOKEN']
  end
end
