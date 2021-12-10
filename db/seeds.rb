# frozen_string_literal: true

require 'factory_bot_rails'
# Create an initial sample user.

FactoryBot.create(:user)

Rails.logger.info 'Created an initial sample user'
