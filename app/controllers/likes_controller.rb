class LikesController < ApplicationController
  def count_likes
    videos = Video.all
    for v in videos
      likes = Like.where video_id: v.id
      v.like = likes.size
      v.save
    end
  end
  def create
    authenticate_user!
    user_id = current_user.id
    video_id = params[:video_id]
    @like = Like.where(user_id: user_id, video_id: video_id).first_or_create do |l|
    end
    @a = "<a class='button button-fill button-big color-gray like'>こいほー済み</a>"
    @likes = Like.where(video_id: video_id)
    render :_who, layout: false
  end
  def who
    video_id = params[:video_id]
    if signed_in?
      before = "<a class='button button-fill button-big color-red like koiho' data-method='GET' data-remote='true' data-type='html' data-update='.like-area' href='/like/#{video_id}'>この動画にこいほーする</a>"
    else
      before = "<a class='button button-fill button-big color-red like close-popup open-panel' onclick=''>この動画にこいほーする</a>"
    end
    after = "<a class='button button-fill button-big color-gray like close-popup'>こいほー済み</a>"
    if user_signed_in?
      if Like.where(user_id: current_user.id, video_id: video_id).size >= 1
        @a = after
      else
        @a = before
      end
    else
      @a = before
    end
    @likes = Like.where(video_id: video_id)
    render :_who, layout: false
  end
end
