class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    # respond_to do |format|
       if @post.save
         flash[:notice] = "Post was successfully created"
         redirect_to @post
    #     format.html { redirect_to @post, notice: "Post was successfully created." }
    #     format.json { render :show, status: :created, location: @post }
       else
         render 'new'
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @post.errors, status: :unprocessable_entity }
       end
    # end
  end

  def update
    # respond_to do |format|
       if @post.update(post_params)
         flash[:notice] = "Post was successfully updated"
         redirect_to @post
    #     format.html { redirect_to @post, notice: "Post was successfully updated." }
    #     format.json { render :show, status: :ok, location: @post }
       else
         render 'edit'
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @post.errors, status: :unprocessable_entity }
       end
    # end
  end


  def destroy
    @post.destroy
    flash[:notice] = "Post was successfully deleted"
    redirect_to posts_url
    # respond_to do |format|
      # format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      # format.json { head :no_content }
    # end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content)
    end
end
