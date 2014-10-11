class UserVoteCategoryQuery

  def initialize(user, categroy)
    @user = user
    @categroy = categroy
  end

  def get
    Vote.where(user_id: @user, category: @categroy)
  end

end