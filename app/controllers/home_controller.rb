class HomeController < ApplicationController
  before_action :set_collection

  def index
    @highlight_post = Post.last || Post.new_blank
    @recent_posts = scope_post(9).where.not(id: @highlight_post)
  end

  def searcher
    @q = Post.ransack(title_cont: params[:q])
    @posts = @q.result(distinct: true).order(id: :desc).limit(20)
  end

  private

  def scope_post(limit = 9, category = nil)
    scope = Post.order(id: :desc).limit(limit)
    scope = scope.by_category(category) if category
    scope
  end
end
