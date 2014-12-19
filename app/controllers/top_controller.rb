class TopController < ApplicationController
  def show
    @users = User.all
    @videos = Video.all
  end
end
