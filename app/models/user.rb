class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_length_of :email, maximum: 45
  validates :username, presence: false

  def gravatar
    email_address = params[:email].downcase
    hash = Digest::MD5.hexdigest(email_address)
    image_src = "https://www.gravatar.com/avatar/#{hash}"
  end
end
