# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WelcomePagesController, type: :routing do
  describe 'routing' do
    it 'routes to #welcome' do
      expect(get: 'welcome').to route_to('welcome_pages#welcome')
    end

    it 'routes to #about' do
      expect(get: 'about').to route_to('welcome_pages#about')
    end

    it 'routes to #contacts' do
      expect(get: 'contacts').to route_to('welcome_pages#contacts')
    end
  end
end
