class UsersController < ApplicationController
  def top
    twitter = Twitter::REST::Client.new do |config|
      config.consumer_key = "xXLIao0TrTyx2ZeXg2eNBygPw"
      config.consumer_secret = "HJHc76kF6CqASNH0xrTDLQyoCR0lSU68TPwLb8Ix34bGyOYSKz"
      config.access_token = current_user.token
      config.access_token_secret = current_user.secret
    end

    @username = params[:username]
    @post_id = params[:post_id]

    @posts = Post.where(username: @username).order("created_at DESC")
    @user = User.where(username: @username)[0]
    updated_at = Time.parse(@user.updated_at.to_s)
    now = Time.now
    if now - updated_at > 10000
      user = twitter.user(@username)
      User.update @user.id, profile_image_url: user.profile_image_url.to_s, name: user.name, location: user.location, description: user.description, friends_count: user.friends_count, followers_count: user.followers_count
      @user = User.find @user.id
    end
    unless @user
      @user = twitter.user(@username)
    end
  end

  def secret
    twitter = Twitter::REST::Client.new do |config|
      config.consumer_key = "xXLIao0TrTyx2ZeXg2eNBygPw"
      config.consumer_secret = "HJHc76kF6CqASNH0xrTDLQyoCR0lSU68TPwLb8Ix34bGyOYSKz"
      config.access_token = current_user.token
      config.access_token_secret = current_user.secret
    end

    @username = current_user.username
    friend_ids = twitter.friend_ids @username 
    ids = Array.new
    for f in friend_ids 
      ids.push f
    end
    ids.reverse!
    @all = ids.size
    @friends = twitter.users ids

    @all_after_users = ids.size

    @small = Array.new
    for f in @friends
      if f.followers_count < 20 
        @small.push f.screen_name
      end
    end

    #twitter.unfollow @small


=begin
    @followers = twitter.follower_ids @username 
    @friends = twitter.friend_ids @username

    followers_array = Array.new
    friends_array = Array.new
    for f in @followers
      followers_array.push f
    end
    for f in @friends
      friends_array.push f
    end

    @users = friends_array - followers_array
=end
  end
end
