class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def show
  	@post = Post.find(params[:id])
  end

  def create
  	@post = Post.new(title: params[:post][:title], image: params[:post][:image], description: params[:post][:description])

  	if @post.save
  		redirect_to posts_path, notice: "Successfully Added Post"
  	else
  		redirect_to :back, notice: "Failed to Add Post"
  	end
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])
  	if @post.update(title: params[:post][:title], image: params[:post][:image], description: params[:post][:description])
  		redirect_to posts_path, notice: "Successfully Updated Post"
  	else
  		redirect_to :back, notice: "Failed to Update Post"
  	end
  end

  def destroy
  	@post = Post.find(params[:id])
  	if @post.delete 
  		redirect_to posts_path, notice: "Successfully Deleted Post"
  	else
  		redirect_to :back
  	end
  end
end
