class UsersController < ApplicationController
  def secret
    @username = current_user.username
    if @username != "carp_joshi"
      return
    end

    twitter = Twitter::REST::Client.new do |config|
      config.consumer_key = "xXLIao0TrTyx2ZeXg2eNBygPw"
      config.consumer_secret = "HJHc76kF6CqASNH0xrTDLQyoCR0lSU68TPwLb8Ix34bGyOYSKz"
      config.access_token = current_user.token
      config.access_token_secret = current_user.secret
    end


=begin
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
      if f.followers_count * 2 < f.friends_count && f.followers_count < 30
        @small.push f.screen_name
      end
    end

    @users = @small

#    twitter.unfollow @small
=end

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
    @users.reverse!

    twitter.unfollow @users.first(300)
  end

  def secret2
    if @username != "carp_joshi"
      return
    end
    twitter = Twitter::REST::Client.new do |config|
      config.consumer_key = "xXLIao0TrTyx2ZeXg2eNBygPw"
      config.consumer_secret = "HJHc76kF6CqASNH0xrTDLQyoCR0lSU68TPwLb8Ix34bGyOYSKz"
      config.access_token = current_user.token
      config.access_token_secret = current_user.secret
    end

    followers = twitter.follower_ids(params[:username], {count: 200})
    my_followers = twitter.follower_ids @username 
    ids = Array.new
    for f in followers
      ids.push f
    end
    for m in my_followers
      ids.push m
    end

    @users = f - m

    twitter.follow @users.first(250)
  end

  def secret3
    if @username != "carp_joshi"
      return
    end
    twitter = Twitter::REST::Client.new do |config|
      config.consumer_key = "xXLIao0TrTyx2ZeXg2eNBygPw"
      config.consumer_secret = "HJHc76kF6CqASNH0xrTDLQyoCR0lSU68TPwLb8Ix34bGyOYSKz"
      config.access_token = current_user.token
      config.access_token_secret = current_user.secret
    end

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
      if f.followers_count * 3 < f.friends_count && f.followers_count < 30
        @small.push f.screen_name
      end
    end

    @users = @small

    twitter.unfollow @small
  end

end
