class User < ActiveRecord::Base

  include Voter

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_initialize :init

  def init
    return if password.present?
    pass = Digest::SHA1.hexdigest(email + Time.current.to_s)
    self.password = pass
    self.password_confirmation = pass
  end

end
