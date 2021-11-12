class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_length_of :email, maximum: 45
  validates :username, presence: false

  def gravatar
    hash = Digest::MD5.hexdigest(email.downcase)
    image_src = "https://www.gravatar.com/avatar/#{hash}?s=48"
  end
end
