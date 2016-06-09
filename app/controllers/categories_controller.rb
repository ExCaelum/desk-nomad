class CategoriesController < ApplicationController
  before_action :check_slug

  def show
    @category = Category.find_by(slug: params[:slug])
  end

  private

  def check_slug
    render file: '/public/not_found' if Category.find_by(slug: params[:slug]) == nil
  end

end
