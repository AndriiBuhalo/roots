# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WelcomePagesController, type: :routing do
  describe 'routing' do
    it 'routes to #home' do
      expect(get: '/welcome_pages/home').to route_to('welcome_pages#home')
    end

    it 'routes to #about' do
      expect(get: '/welcome_pages/about').to route_to('welcome_pages#about')
    end

    it 'routes to #contacts' do
      expect(get: '/welcome_pages/contacts').to route_to('welcome_pages#contacts')
    end
  end
end
