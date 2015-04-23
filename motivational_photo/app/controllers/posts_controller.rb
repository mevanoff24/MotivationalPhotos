class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def show
  end

  def create
  	@post = Post.new(title: params[:post][:title], image: params[:post][:image], description: params[:post][:description])

  	if @post.save
  		redirect_to posts_path, notice: "Successfully added post"
  	else
  		redirect_to :back, notice: "Failed to Add Post"
  	end
  end
end
