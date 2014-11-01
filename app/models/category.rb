class Category < ActiveRecord::Base

  has_many :nominees
  mount_uploader :image, PictureUploader

end
