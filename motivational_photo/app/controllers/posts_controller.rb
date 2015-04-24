class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :authenticate_user!, except: [:index, :show]

  def index
  	@posts = Post.all.order("created_at DESC")
  end

  def new
    if current_user
  	  @post = current_user.posts.build
    else
      redirect_to new_user_registration_path
    end
  end

  def show
    @comments = Comment.where(post_id: @post)
    @random_post = Post.where.not(id: @post).order("RANDOM()").first
  end

  def create
  	@post = current_user.posts.build(post_params)
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

  def upvote
    @post.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @post.downvote_by current_user
    redirect_to :back
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :link, :description, :image)
  end
end
