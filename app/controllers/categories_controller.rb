class CategoriesController < ApplicationController

  before_filter :check_user

  def index
    categories = Category.all.sort
    @categories_voted = categories.reject { |c| current_user.voted? c }.shuffle
    @categories_not_voted = categories.select { |c| current_user.voted? c }
  end

  def show
    @category = Category.find(params[:id])
    @not_nominated_users = UsersNotNominatedQuery.new(@category).get.order(name: :asc)
  end

end