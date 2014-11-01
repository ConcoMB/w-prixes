class CategoriesController < ApplicationController

  before_filter :check_user

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @not_nominated_users = UsersNotNominatedQuery.new(@category).get.order(name: :asc)
  end

end