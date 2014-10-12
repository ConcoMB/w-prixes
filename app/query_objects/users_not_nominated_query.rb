class UsersNotNominatedQuery

  def initialize(category)
    @category = category
  end

  def get
    User.where.not(id: Nominee.where(category: @category).pluck(:user_id))
  end

end