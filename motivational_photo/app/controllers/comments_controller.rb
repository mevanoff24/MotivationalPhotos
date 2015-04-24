class CommentsController < ApplicationController

  before_action :authenticate_user!

	def create
		p params
		@post = Post.find(params[:post_id])
		@comment = Comment.new(content: params[:comment][:content], post_id: params[:post_id], user_id: current_user.id)

		if @comment.save
			redirect_to post_path(@post)
		else
			render 'new'
		end

	end
end
