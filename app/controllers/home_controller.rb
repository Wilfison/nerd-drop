class HomeController < ApplicationController
  def index
    @categories = Category.all.order(:name)
    @highlight_post = Post.last
    @recent_posts = scope_post(9).where.not(id: @highlight_post)
  end

  private

  def scope_post(limit = 9, category = nil)
    scope = Post.order(id: :desc).limit(limit)
    scope = scope.by_category(category) if category
    scope
  end
end
