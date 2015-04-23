class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
  	@posts = Post.all.order("created_at DESC")
  end

  def new
  	@post = Post.new
  end

  def show
  end

  def create
  	@post = Post.new(post_params)
  	if @post.save
  		redirect_to post_path(@post), notice: "Successfully Added Post"
  	else
  		render 'new', notice: "Failed to Add Post"
  	end
  end

  def edit
  end

  def update
  	if @post.update(post_params)
  		redirect_to post_path(@post), notice: "Successfully Updated Post"
  	else
  		redirect_to :back, notice: "Failed to Update Post"
  	end
  end

  def destroy
  	if @post.delete 
  		redirect_to posts_path, notice: "Successfully Deleted Post"
  	else
  		redirect_to :back
  	end
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :image, :description)
  end
end
