class NomineesController < ApplicationController

  def create
    category = Category.find(params[:category_id])
    Nominee.create!(resource_params.first) unless category.is_closed_to_nominate
    redirect_to :back 
  end

  def resource_params
    return [] if request.get?
     [params.require(:nominee).permit(:category_id, :user_id)]
  end

end