class ResultsController < ApplicationController

  before_filter :check_user

  def index
    redirect_to :back unless current_user.is_admin
    @results = ResultsContext.new.get
  end

end