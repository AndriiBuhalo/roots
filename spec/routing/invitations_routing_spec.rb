# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InvitationsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/invitations').to route_to('invitations#index')
    end

    it 'routes to #new' do
      expect(get: '/invitations/new').to route_to('invitations#new')
    end
  end
end
