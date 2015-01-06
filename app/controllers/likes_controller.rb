class LikesController < ApplicationController
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
    before = "<a class='button button-fill button-big color-red like' data-method='GET' data-remote='true' data-type='html' data-update='.like-area' href='like/#{video_id}'>この動画にこいほーする</a>"
    after = "<a class='button button-fill button-big color-gray like close-popup'>こいほー済み</a>"
    if user_signed_in?
      if Like.where(user_id: current_user.id, video_id: video_id).size >= 1
        @a = after
      else
        @a = before
      end
    else
      @a = before
      @explanation = "<p class='exp'>お気に入り追加にはTwitterログインが必要です。<br>Twitterログインにより許可なく投稿が発生することはありません。</p>"
    end
    @likes = Like.where(video_id: video_id)
    render :_who, layout: false
  end
end
