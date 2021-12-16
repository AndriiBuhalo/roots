# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :posts, inverse_of: :created_by, foreign_key: 'created_by_id', dependent: :destroy
  has_many :locations, inverse_of: :created_by, foreign_key: 'created_by_id', dependent: :destroy
  has_many :important_dates, inverse_of: :created_by, foreign_key: 'created_by_id', dependent: :destroy

  validates :email, length: { maximum: 45 }
  validates :username, presence: false

  def gravatar
    hash = Digest::MD5.hexdigest(email.downcase)
    "https://www.gravatar.com/avatar/#{hash}?s=32"
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.find_by(email: data['email'])
    user ||= User.create(
      email: data['email'],
      password: Devise.friendly_token[0, 20]
    )
  end
end
