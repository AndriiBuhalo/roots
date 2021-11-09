 require 'rails_helper'

RSpec.describe "/posts", type: :request do

  describe "GET /index" do
    it "renders a successful response" do
      get posts_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      post = create(:post)
      get post_url(post)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_post_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      post = create(:post)
      get edit_post_url(post)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      let(:valid_post) { create(:post) }

      it "creates a new Post" do
        post "/posts", :params => { :post => {:title => valid_post.title, :content => valid_post.content} }
        expect(response).to render_template(:show)
      end

      it "redirects to the created post" do
        post "/posts", :params => { :post => {:title => valid_post.title, :content => valid_post.content} }
        expect(response).to redirect_to(post_url(Post.last))
      end
    end

    context "with invalid parameters" do
      let(:post) { create(:invalid_post) }
      it "does not create a new Post" do
        expect {
        post "/posts", :params => { :post => {:title => post.title, :content => post.content} }
        }.to change(Post, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post "/posts", :params => { :post => {:title => post.title, :content => post.content} }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:valid_post) { create(:post) }

      it "updates the requested post" do
         patch "/posts#{valid_post.id}", :params => { :post => {:title => valid_post.title, :content => valid_post.content} }
         valid_post.reload
         expect(response.body).to include 'Post was successfully updated'
      end

      it "redirects to the post" do
        patch "/posts/#{valid_post.id}", :params => { :post => {:title => valid_post.title, :content => valid_post.content} }
        valid_post.reload
        expect(response).to redirect_to(post_url(valid_post))
      end
    end

    context "with invalid parameters" do
      let(:post) { create(:invalid_post) }
      it "renders a successful response (i.e. to display the 'edit' template)" do
        expect {
          patch "/posts", :params => { :post => {:title => post.title, :content => post.content} }
        }.to change(Post, :count).by(0)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested post" do
      post = create(:post)
      expect {
        delete post_url(post)
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      post = create(:post)
      delete post_url(post)
      expect(response).to redirect_to(posts_url)
    end
  end
end
