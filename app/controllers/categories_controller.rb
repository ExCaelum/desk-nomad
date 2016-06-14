class CategoriesController < ApplicationController
  before_action :check_slug, only: :show

  def show
    @category = Category.find_by(slug: params[:slug])
  end

  def index
    @categories = Category.all
  end

  private

  def check_slug
    render file: '/public/not_found' if Category.find_by(slug: params[:slug]) == nil
  end

end
