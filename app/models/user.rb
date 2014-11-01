class User < ActiveRecord::Base

  include Voter

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_create :init
  mount_uploader :avatar, PictureUploader

  def password_required?
    false
  end

  def init
    return if encrypted_password.present?
    pass = Digest::SHA1.hexdigest(email + Time.current.to_s)
    self.password = pass
    self.password_confirmation = pass
  end

end
