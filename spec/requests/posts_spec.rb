# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/posts', type: :request do

  describe 'GET /index' do
    it 'renders a successful response' do
      get posts_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    let(:valid_post) { create(:post) }

    it 'renders a successful response' do
      get post_url(valid_post)
      expect(response).to render_template(:show)
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_post_url
      expect(response).to render_template(:new)
    end
  end

  describe 'GET /edit' do
    let(:valid_post) { create(:post) }

    it 'render a successful response' do
      get edit_post_url(valid_post)
      expect(response).to render_template(:edit)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let(:valid_post) do
        {
          title: Faker::Lorem.characters(number: 3),
          content: Faker::Lorem.characters(number: 20)
        }
      end

      it 'creates a new Post' do
        post posts_url, params: { post: valid_post }
        expect(response).to redirect_to(assigns(:post))
        follow_redirect!
        expect(response).to render_template(:show)
        expect(response.body).to include('Post was successfully created')
      end
    end

    context 'with invalid parameters' do
      let(:post) { build(:invalid_post) }

      it 'does not create a new Post' do
        expect(post).not_to be_valid
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        get new_post_url
        expect(response).to render_template(:new)
        expect(post).not_to be_valid
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let!(:valid_post) { create(:post) }
      let(:edited_post) do
        {
          title: Faker::Lorem.characters(number: 3),
          content: Faker::Lorem.characters(number: 20)
        }
      end

      it 'updates the requested post' do
        get edit_post_url(valid_post)
        expect(response).to render_template(:edit)
        patch post_url(valid_post), params: { post: edited_post }
        expect(response).to redirect_to(post_url(valid_post))
        follow_redirect!
        expect(response).to render_template(:show)
        expect(response.body).to include('Post was successfully updated')
      end
    end

    context 'with invalid parameters' do
      let!(:valid_post) { create(:post) }
      let(:edited_invalid_post) do
        {
          title: Faker::Lorem.characters(number: 40),
          content: ' '
        }
      end

      it "renders a successful response (i.e. to display the 'edit' template)" do
        get edit_post_url(valid_post)
        expect(response).to render_template(:edit)
        patch post_url(valid_post), params: { post: edited_invalid_post }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE /destroy' do
    let!(:valid_post) { create(:post) }

    it 'destroys the requested post' do
      expect do
        delete post_url(valid_post)
      end.to change(Post, :count).by(-1)
    end

    it 'redirects to the posts list' do
      delete post_url(valid_post)
      expect(response).to redirect_to(posts_url)
    end
  end
end