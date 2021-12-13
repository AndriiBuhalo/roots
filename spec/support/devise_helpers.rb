# frozen_string_literal: true

module DeviseHelpers
  def include_devise_helper
    include Devise::Test::IntegrationHelpers
  end
end
