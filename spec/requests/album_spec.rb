 require 'rails_helper'

 RSpec.describe "/album", type: :request do

  describe "GET /index" do
    it 'renders a successful response' do
      get album_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    let(:valid_album) { create(:album) }
    it "renders a successful response" do
      get album_url(valid_album)
      expect(response).to render_template(:show)
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_album_url
      expect(response).to render_template(:new)
    end
  end

  describe "GET /edit" do
    let(:valid_album) { create(:album) }
    it "render a successful response" do
      get edit_album_url(valid_album)
      expect(response).to render_template(:edit)
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      let(:valid_album) do
      {
       name: Faker::Lorem.characters(number: 10),
       description: Faker::Lorem.characters(number: 10),
      }
      end

      it "creates a new Album" do
        post album_url, params: { album: valid_album }
        expect(response).to redirect_to(assigns(:album))
        follow_redirect!
        expect(response).to render_template(:show)
        expect(response.body).to include("Album successfully added!")
      end
    end

    context "with invalid parameters" do
      let(:album) { build(:invalid_album) }
      it "does not create a new Album" do
        expect(album).not_to be_valid
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        get new_album_url
        expect(response).to render_template(:new)
        expect(album).not_to be_valid
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PATCH /update" do

    context "with valid parameters" do
      let!(:valid_album) { create(:album) }
      let(:edited_album) do
      {
       name: Faker::Lorem.characters(number: 10),
       description: Faker::Lorem.characters(number: 10),
      }
     end
      it "updates the requested post" do
        get edit_album_url(valid_album)
        expect(response).to render_template(:edit)
        patch album_url(valid_album), params: { album: edited_album }
        expect(response).to redirect_to(album_url(valid_album))
        follow_redirect!
        expect(response).to render_template(:show)
        expect(response.body).to include("Album successfully modified!")
      end

    end

    context "with invalid parameters" do
      let!(:valid_album) { create(:album) }
      let(:edited_invalid_album) do
      {
       name: " ",
       description: Faker::Lorem.characters(number: 1)
       }
      end

      it "renders a successful response (i.e. to display the 'edit' template)" do
        get edit_album_url(valid_album)
        expect(response).to render_template(:edit)
        patch album_url(valid_album), params: { album: edited_invalid_album }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:valid_album) { create(:album) }

    it "destroys the requested album" do
      expect {
        delete album_url(valid_album)
      }.to change(Album, :count).by(-1)
    end

    it "redirects to the albums list" do
      delete album_url(valid_album)
      expect(response).to redirect_to(album_url)
    end
  end
end
