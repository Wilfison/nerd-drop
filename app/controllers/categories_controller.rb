class CategoriesController < ApplicationController
  before_action :set_collection

  def show
    @category = Category.find_by(id: params[:id])
    @posts = scope_post(20, params[:id])
  end

  private

  def scope_post(limit = 9, category = nil)
    scope = Post.order(id: :desc).limit(limit)
    scope = scope.by_category(category) if category
    scope
  end
end
