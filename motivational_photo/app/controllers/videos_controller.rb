class VideosController < ApplicationController
  def index
  	@youtube = Video.main
  	@youtube1 = Video.get_service
  end
end
