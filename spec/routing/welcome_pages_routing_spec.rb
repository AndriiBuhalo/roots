# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WelcomePagesController, type: :routing do
  describe 'routing' do
    it 'routes to #welcome' do
      expect(get: '/welcome_pages/welcome').to route_to('welcome_pages#welcome')
    end

    it 'routes to #about' do
      expect(get: '/welcome_pages/about').to route_to('welcome_pages#about')
    end

    it 'routes to #contacts' do
      expect(get: '/welcome_pages/contacts').to route_to('welcome_pages#contacts')
    end
  end
end
