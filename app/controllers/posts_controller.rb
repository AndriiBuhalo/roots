# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :set_index_breadcrumb, only: %i[show edit new]

  def index
    @posts = Post.all
    add_breadcrumb(t('posts.index.breadcrumb'))
  end

  def show
    add_breadcrumb(t('posts.show.breadcrumb', title: @post.title))
  end

  def new
    @post = Post.new
    add_breadcrumb(t('posts.new.breadcrumb'))
  end

  def edit
    add_breadcrumb(t('posts.show.breadcrumb', title: @post.title), post_path(@post))
    add_breadcrumb(t('posts.edit.breadcrumb', title: @post.title))
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

  def set_index_breadcrumb
    add_breadcrumb(t('posts.index.breadcrumb'), posts_path)
  end
end
