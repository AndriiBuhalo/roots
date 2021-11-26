# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  validates :email, length: { maximum: 45 }
  validates :username, presence: false

  def gravatar
    hash = Digest::MD5.hexdigest(email.downcase)
    image_src = "https://www.gravatar.com/avatar/#{hash}?s=32"
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    user ||= User.create(
      email: data['email'],
      password: Devise.friendly_token[0, 20]
    )
    user
  end

  def any_login_name
    [
      full_name + ' - ' + email + " Domains: #{domains.collect(&:short_code).join(',').presence || 'none'}; Role: #{role}; ID: #{id}", id
    ]
  end

  def self.grouped_users
    Organization.ordered.includes(:employees).each_with_object({}) do |org, res|
      res[org.name] = org.employees.ordered.includes(%i[domains organization])
    end
  end
end
