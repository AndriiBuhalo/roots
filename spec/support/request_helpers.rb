# frozen_string_literal: true

module RequestHelpers
  def include_request_helper
    include Devise::Test::IntegrationHelpers
  end
end
