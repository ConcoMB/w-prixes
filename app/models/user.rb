class User < ActiveRecord::Base

  include Voter

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
