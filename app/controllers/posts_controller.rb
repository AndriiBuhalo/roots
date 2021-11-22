# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all
    set_meta_tags title: t('posts.index.page_title')
  end

  def show
    set_meta_tags title: @post.title
  end

  def new
    @post = Post.new
    set_meta_tags title: t('posts.new.page_title')
  end

  def edit
    set_meta_tags title: t('posts.edit.page_title')
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = t('.controller.create')
      redirect_to @post
    else
      render 'new'
    end
  end

  def update
    if @post.update(post_params)
      flash[:notice] = t('.controller.update')
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = t('.controller.destroy')
    redirect_to posts_url
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
