# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InvitationsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/invitations').to route_to('invitations#index')
    end
  end
end
