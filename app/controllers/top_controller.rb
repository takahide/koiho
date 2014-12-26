class TopController < ApplicationController
  def show
    video_id = params[:id]
    if video_id
      featured_video = Video.find video_id
      @featured_video_html = '<iframe width="100%" height="200" src="//www.youtube.com/embed/' + featured_video.youtube_id  + '" frameborder="0" allowfullscreen></iframe>'
    end
    @users = User.all
    @videos = Video.all
  end
  def test
  end
end
