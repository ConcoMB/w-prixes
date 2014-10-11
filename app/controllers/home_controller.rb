class HomeController < ApplicationController

  def show
    return redirect_to new_user_session_path unless user_signed_in?
    redirect_to categories_path
  end

end