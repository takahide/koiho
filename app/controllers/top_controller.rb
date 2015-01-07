class TopController < ApplicationController
  def show
    username = params[:username]
    youtube_id = params[:youtube_id]
    if youtube_id
      featured_video = Video.find_by_youtube_id youtube_id
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
      @user = true
    else
      @videos = Video.all
      @title = "人気の動画"
      @user = false
    end
    @users = User.all
  end
  def test
  end
end
