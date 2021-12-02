# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ImportantDatesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/important_dates').to route_to('important_dates#index')
    end

    it 'routes to #new' do
      expect(get: '/important_dates/new').to route_to('important_dates#new')
    end

    it 'routes to #show' do
      expect(get: '/important_dates/1').to route_to('important_dates#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/important_dates/1/edit').to route_to('important_dates#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/important_dates').to route_to('important_dates#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/important_dates/1').to route_to('important_dates#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/important_dates/1').to route_to('important_dates#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/important_dates/1').to route_to('important_dates#destroy', id: '1')
    end
  end
end
