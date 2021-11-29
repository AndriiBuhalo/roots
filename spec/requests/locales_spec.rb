# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Locales', type: :request do
  describe 'PATCH /update' do
    it 'saves :en locale in cookies' do
      patch locale_path(:en)
      expect(cookies[:locale]).to eq('en')
    end
  end

  describe 'PUT /update' do
    it 'saves :en locale in cookies' do
      put locale_path(:en)
      expect(cookies[:locale]).to eq('en')
    end
  end

  describe 'PATCH /update' do
    it 'saves :uk locale in cookies' do
      patch locale_path(:uk)
      expect(cookies[:locale]).to eq('uk')
    end
  end

  describe 'PUT /update' do
    it 'saves :uk locale in cookies' do
      put locale_path(:uk)
      expect(cookies[:locale]).to eq('uk')
    end
  end
end
