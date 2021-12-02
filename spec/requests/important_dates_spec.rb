# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/important_dates', type: :request do
  let(:valid_attributes) do
    {
    skip('Add a hash of attributes valid for your model')
    }
  end

  let(:invalid_attributes) do
    {
    skip('Add a hash of attributes invalid for your model')
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      ImportantDate.create! valid_attributes
      get important_dates_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      important_date = ImportantDate.create! valid_attributes
      get important_date_url(important_date)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_important_date_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      important_date = ImportantDate.create! valid_attributes
      get edit_important_date_url(important_date)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new ImportantDate' do
        expect do
          post important_dates_url, params: { important_date: valid_attributes }
        end.to change(ImportantDate, :count).by(1)
      end

      it 'redirects to the created important_date' do
        post important_dates_url, params: { important_date: valid_attributes }
        expect(response).to redirect_to(important_date_url(ImportantDate.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new ImportantDate' do
        expect do
          post important_dates_url, params: { important_date: invalid_attributes }
        end.to change(ImportantDate, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post important_dates_url, params: { important_date: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested important_date' do
        important_date = ImportantDate.create! valid_attributes
        patch important_date_url(important_date), params: { important_date: new_attributes }
        important_date.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the important_date' do
        important_date = ImportantDate.create! valid_attributes
        patch important_date_url(important_date), params: { important_date: new_attributes }
        important_date.reload
        expect(response).to redirect_to(important_date_url(important_date))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        important_date = ImportantDate.create! valid_attributes
        patch important_date_url(important_date), params: { important_date: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested important_date' do
      important_date = ImportantDate.create! valid_attributes
      expect do
        delete important_date_url(important_date)
      end.to change(ImportantDate, :count).by(-1)
    end

    it 'redirects to the important_dates list' do
      important_date = ImportantDate.create! valid_attributes
      delete important_date_url(important_date)
      expect(response).to redirect_to(important_dates_url)
    end
  end
end
