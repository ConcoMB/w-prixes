module Voter
  extend ActiveSupport::Concern

  included do

    def voted?(category)
      UserVoteCategoryQuery.new(self, category).get.size > 0
    end

  end

end