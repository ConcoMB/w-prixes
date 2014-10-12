class VotesController < ApplicationController

  def create
    return redirect_to :back if current_user.voted?(Category.find(resource_params.first[:category_id]))
    @vote = Vote.create!(resource_params.first)
  end

  private

  def resource_params
    return [] if request.get?
     [params.require(:vote).permit(:category_id, :user_id, :nominee_id)]
  end

end