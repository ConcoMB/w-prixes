class Vote < ActiveRecord::Base

  belongs_to :category
  belongs_to :user
  belongs_to :nominee

end
