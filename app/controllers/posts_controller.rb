# frozen_string_literal: true

class PostsController < DashboardController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.by_user(current_user).paginate(page: params[:page], per_page: PER_PAGE)
  end

  def show; end

  def new
    @post = Post.by_user(current_user).new
  end

  def edit; end

  def create
    @post = Post.by_user(current_user).new(post_params)
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
    @post = Post.by_user(current_user).find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
