class ApplicationController < ActionController::Base
  def set_collection
    @categories = Category.all.order(:name)
  end
end
