# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/attachments', type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { create(:user) }

  before do
    login_as(user)
  end

  after do
    logout(user)
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      get attachment_index_path
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    let(:valid_attachment) { create(:attachment, created_by: user) }

    it 'renders a successful response' do
      get attachment_path(valid_attachment)
      expect(response).to render_template(:show)
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_attachment_url
      expect(response).to render_template(:new)
    end
  end

  describe 'GET /edit' do
    let(:valid_attachment) { create(:attachment, created_by: user) }

    it 'render a successful response' do
      get edit_attachment_url(valid_attachment)
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let(:valid_attachment) do
        {
          file: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/attachment/test.jpg')))
        }
      end

      it 'creates a new Attachment' do
        post attachment_index_path, params: { attachment: valid_attachment }
        expect(response).to redirect_to(assigns(:attachment))
        follow_redirect!
        expect(response).to render_template(:show)
        expect(response.body).to include('File successfully added!')
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attachment) { build(:attachment, :invalid_attachment) }

      it 'does not create a new Attachment' do
        expect(invalid_attachment).not_to be_valid
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        get new_attachment_url
        expect(response).to render_template(:new)
        expect(invalid_attachment).not_to be_valid
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let!(:valid_attachment) { create(:attachment, created_by: user) }
      let(:edited_attachment) do
        {
          file: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/attachment/test.jpg')))
        }
      end

      it 'updates the requested post' do
        get edit_attachment_url(valid_attachment)
        expect(response).to render_template(:edit)
        patch attachment_path(valid_attachment), params: { attachment: edited_attachment }
        expect(response).to redirect_to(attachment_path(valid_attachment))
        follow_redirect!
        expect(response).to render_template(:show)
        expect(response.body).to include('Information changed successfully!')
      end
    end

    context 'with invalid parameters' do
      let!(:valid_attachment) { create(:attachment, created_by: user) }
      let(:edited_invalid_attachment) do
        {
          file: ' '
        }
      end

      it "renders a successful response (i.e. to display the 'edit' template)" do
        get edit_attachment_url(valid_attachment)
        expect(response).to render_template(:edit)
        patch attachment_url(valid_attachment), params: { attachment: edited_invalid_attachment }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:valid_attachment) { create(:attachment, created_by: user) }

    it 'destroys the requested attachment' do
      expect { delete attachment_path(valid_attachment) }.to change(Attachment, :count).by(-1)
    end

    it 'redirects to the attachments list' do
      delete attachment_path(valid_attachment)
      expect(response).to redirect_to(attachment_index_path)
    end
  end
end
