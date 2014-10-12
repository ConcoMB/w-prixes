module Voter
  extend ActiveSupport::Concern

  included do

    def voted?(category)
      find_vote(category).present?
    end

    def find_vote(category)
      UserVoteCategoryQuery.new(self, category).get
    end

  end

end