require 'rails_helper'

RSpec.describe 'Locations', type: :request do
  let(:user) { create(:user) }

  before(:each) { sign_in(user) }

  describe 'GET /index' do
    it 'renders a successful response' do
      get locations_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    let(:location_by_user) { create(:location, created_by: user) }

    it 'renders a successful response' do
      get location_url(location_by_user)
      expect(response).to render_template(:show)
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_location_url
      expect(response).to render_template(:new)
    end
  end

  describe 'GET /edit' do
    let(:location_by_user) { create(:location, created_by: user) }

    it 'render a successful response' do
      get edit_location_url(location_by_user)
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST /create' do
    context 'when parameters are valid' do
      let(:location_by_user) { attributes_for(:location) }

      it 'creates a new location' do
        post locations_url, params: { location: location_by_user }
        expect(response).to redirect_to(assigns(:location))
        follow_redirect!
        expect(response).to render_template(:show)
        expect(response.body).to include('Location was successfully created')
      end
    end

    context 'when parameters are not valid' do
      let(:invalid_location) { attributes_for(:location, :invalid_location) }

      it 'does not create a new location' do
        expect { post locations_url, params: { location: invalid_location } }.to change(Location, :count).by(0)
      end

      it 'renders a new template' do
        post locations_url, params: { location: invalid_location }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH /update' do
    context 'when parameters are valid' do
      let(:location_by_user) { create(:location, created_by: user) }
      let(:edited_location) do
        {
          name: Faker::Address.city,
          address: Faker::Address.full_address,
          latitude: Faker::Number.decimal(l_digits: 1, r_digits: 6),
          longitude: Faker::Number.decimal(l_digits: 1, r_digits: 6)
        }
      end

      it 'updates the requested location' do
        patch location_url(location_by_user), params: { location: edited_location }
        expect(response).to redirect_to(location_url(location_by_user))
        follow_redirect!
        expect(response).to render_template(:show)
        expect(response.body).to include('Location was successfully updated')
      end
    end

    context 'when parameters are not valid' do
      let(:location_by_user) { create(:location, created_by: user) }
      let(:edited_location) do
        {
          name: Faker::Lorem.characters(number: 1),
          address: Faker::Lorem.characters(number: 3),
          latitude: Faker::Number.decimal(l_digits: 1, r_digits: 6),
          longitude: Faker::Number.decimal(l_digits: 1, r_digits: 6)
        }
      end

      it 'renders an edit template' do
        patch location_url(location_by_user), params: { location: edited_location }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:location_by_user) { create(:location, created_by: user) }

    it 'destroys the requested location' do
      expect { delete location_url(location_by_user) }.to change(Location, :count).by(-1)
    end

    it 'redirects to the locations list' do
      delete location_url(location_by_user)
      expect(response).to redirect_to(locations_url)
    end
  end
end
