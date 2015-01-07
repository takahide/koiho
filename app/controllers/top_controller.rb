class TopController < ApplicationController
  def show
    video_id = params[:id]
    username = params[:username]
    if video_id
      featured_video = Video.find video_id
      @featured_video_html = '<iframe width="100%" height="200" src="//www.youtube.com/embed/' + featured_video.youtube_id  + '" frameborder="0" allowfullscreen></iframe>'
    end
    if username
      user = User.find_by_username username
      likes = Like.where user_id: user.id
      @videos = Array.new
      for l in likes
        @videos.push Video.find(l.video_id)
      end
      @title = "@#{username}"
    else
      @videos = Video.all
      @title = "人気の動画"
    end
    @users = User.all
  end
  def test
  end
end
