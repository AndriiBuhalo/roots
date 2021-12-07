# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/important_dates', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { create(:user) }

  before(:each) do
    login_as(user)
  end

  after(:each) do
    logout(user)
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      get important_dates_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    let(:valid_important_date) { create(:important_date, created_by: user) }

    it 'renders a successful response' do
      get important_date_url(valid_important_date)
      expect(response).to render_template(:show)
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_important_date_url
      expect(response).to render_template(:new)
    end
  end

  describe 'GET /edit' do
    let(:valid_important_date) { create(:important_date, created_by: user) }

    it 'render a successful response' do
      get edit_important_date_url(valid_important_date)
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let(:valid_important_date) do
        {
          event: Faker::Lorem.characters(number: 20),
          event_date: Faker::Date.in_date_period,
          description: Faker::Lorem.characters(number: 100)
        }
      end

      it 'creates a new ImportantDate' do
        post important_dates_url, params: { important_date: valid_important_date }
        expect(response).to redirect_to(assigns(:important_date))
        follow_redirect!
        expect(response).to render_template(:show)
        expect(response.body).to include('Important date was successfully created')
      end
    end

    context 'with invalid parameters' do
      let(:invalid_important_date) { build(:important_date, :invalid_important_date) }

      it 'does not create a new ImportantDate' do
        expect(invalid_important_date).not_to be_valid
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        get new_important_date_url
        expect(response).to render_template(:new)
        expect(invalid_important_date).not_to be_valid
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let!(:valid_important_date) { create(:important_date, created_by: user) }
      let(:edited_important_date) do
        {
          event: Faker::Lorem.characters(number: 20),
          event_date: Faker::Date.in_date_period,
          description: Faker::Lorem.characters(number: 100)
        }
      end

      it 'updates the requested important_date' do
        get edit_important_date_url(valid_important_date)
        expect(response).to render_template(:edit)
        patch important_date_url(valid_important_date), params: { important_date: edited_important_date }
        expect(response).to redirect_to(important_date_url(valid_important_date))
        follow_redirect!
        expect(response).to render_template(:show)
        expect(response.body).to include('Important date was successfully updated')
      end
    end

    context 'with invalid parameters' do
      let!(:valid_important_date) { create(:important_date, created_by: user) }
      let(:edited_important_date) do
        {
          event: Faker::Lorem.characters(number: 1),
          event_date: Faker::Date.in_date_period,
          description: Faker::Lorem.characters(number: 1)
        }
      end

      it "renders a successful response (i.e. to display the 'edit' template)" do
        get edit_important_date_url(valid_important_date)
        expect(response).to render_template(:edit)
        patch important_date_url(valid_important_date), params: { important_date: edited_important_date }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:valid_important_date) { create(:important_date, created_by: user) }

    it 'destroys the requested important_date' do
      expect { delete important_date_url(valid_important_date) }.to change(ImportantDate, :count).by(-1)
    end

    it 'redirects to the important_dates list' do
      delete important_date_url(valid_important_date)
      expect(response).to redirect_to(important_dates_url)
    end
  end
end
