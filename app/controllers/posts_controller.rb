# frozen_string_literal: true

class PostsController < DashboardController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :set_update_breadcrumb, only: %i[update]

  def index
    add_breadcrumb(t('posts.index.breadcrumb'))
    @posts = policy_scope(Post).paginate(page: params[:page])
    authorize @posts
  end

  def show
    add_breadcrumb(@post.title)
  end

  def new
    add_breadcrumb(t('posts.new.breadcrumb'))
    @post = policy_scope(Post).new
    authorize @post
  end

  def edit
    add_breadcrumb(@post.title, post_path(@post))
    add_breadcrumb(t('posts.edit.breadcrumb'))
  end

  def create
    @post = policy_scope(Post).new(post_params)
    authorize @post
    if @post.save
      flash[:notice] = t('.controller.create')
      redirect_to @post
    else
      add_breadcrumb(t('posts.new.breadcrumb'))
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
    @post = policy_scope(Post).find(params[:id])
    authorize @post
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def set_update_breadcrumb
    add_breadcrumb(@post.title, post_path(@post))
    add_breadcrumb(t('posts.edit.breadcrumb'))
  end
end
