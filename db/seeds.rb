# frozen_string_literal: true

# Create an initial sample user.
User.create!(username: 'Initial',
             email: 'initial.user@sample.com',
             password: 'initial1',
             password_confirmation: 'initial1',
             created_at: Time.zone.now)

Rails.logger.debug 'Created an initial sample user'
