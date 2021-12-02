# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LocalesController, type: :routing do
  describe 'routing' do
    it 'routes to #update via PUT for en' do
      expect(put: '/locales/en').to route_to('locales#update', id: 'en')
    end

    it 'routes to #update via PATCH for en' do
      expect(patch: '/locales/en').to route_to('locales#update', id: 'en')
    end

    it 'routes to #update via PUT for uk' do
      expect(put: '/locales/uk').to route_to('locales#update', id: 'uk')
    end

    it 'routes to #update via PATCH for uk' do
      expect(patch: '/locales/uk').to route_to('locales#update', id: 'uk')
    end
  end
end
