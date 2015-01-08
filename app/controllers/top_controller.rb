class TopController < ApplicationController
  def show
    if signed_in?
      twitter = Twitter::REST::Client.new do |config|
        config.consumer_key = "xXLIao0TrTyx2ZeXg2eNBygPw"
        config.consumer_secret = "HJHc76kF6CqASNH0xrTDLQyoCR0lSU68TPwLb8Ix34bGyOYSKz"
        config.access_token = current_user.token
        config.access_token_secret = current_user.secret
      end

      updated_at = Time.parse(current_user.updated_at.to_s)
      now = Time.now
      if now - updated_at > 99999999999 || current_user.profile_image_url.nil?
        user = twitter.user(current_user.username)
        User.update current_user.id, profile_image_url: user.profile_image_url.to_s, name: user.name, location: user.location, description: user.description, friends_count: user.friends_count, followers_count: user.followers_count
      end
    end


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
      @profile_image = user.profile_image_url
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
