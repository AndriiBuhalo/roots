require 'rails_helper'

RSpec.describe AttachmentController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/attachment').to route_to('attachment#index')
    end

    it 'routes to #new' do
      expect(get: '/attachment/new').to route_to('attachment#new')
    end

    it 'routes to #show' do
      expect(get: '/attachment/1').to route_to('attachment#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/attachment/1/edit').to route_to('attachment#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/attachment').to route_to('attachment#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/attachment/1').to route_to('attachment#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/attachment/1').to route_to('attachment#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/attachment/1').to route_to('attachment#destroy', id: '1')
    end
  end
end
