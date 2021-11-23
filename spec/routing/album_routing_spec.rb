# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AlbumController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/album').to route_to('album#index')
    end

    it 'routes to #new' do
      expect(get: '/album/new').to route_to('album#new')
    end

    it 'routes to #show' do
      expect(get: '/album/1').to route_to('album#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/album/1/edit').to route_to('album#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/album').to route_to('album#create')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/album/1').to route_to('album#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/album/1').to route_to('album#destroy', id: '1')
    end
  end
end
