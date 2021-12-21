# frozen_string_literal: true

class PostsController < DashboardController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = policy_scope(Post).paginate(page: params[:page])
    authorize @posts
  end

  def show; end

  def new
    @post = policy_scope(Post).new
    authorize @post
  end

  def edit; end

  def create
    @post = policy_scope(Post).new(post_params)
    authorize @post
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
    @post = policy_scope(Post).find(params[:id])
    authorize @post
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
