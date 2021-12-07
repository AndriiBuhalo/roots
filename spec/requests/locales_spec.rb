# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Locales', type: :request do
  describe 'PUT /update to en' do
    it 'saves :en locale in cookies' do
      put locale_path(:en)
      expect(cookies[:locale]).to eq('en')
    end
  end

  describe 'PUT /update to uk' do
    it 'saves :uk locale in cookies' do
      put locale_path(:uk)
      expect(cookies[:locale]).to eq('uk')
    end
  end
end
