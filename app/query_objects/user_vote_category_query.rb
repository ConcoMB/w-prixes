class UserVoteCategoryQuery

  def initialize(user, category)
    @user = user
    @category = category
  end

  def get
    Vote.find_by(user_id: @user, category: @category)
  end

end