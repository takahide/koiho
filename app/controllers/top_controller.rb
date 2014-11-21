class TopController < ApplicationController
  def show
    authenticate_user!
    @players = ["a", "b", "c", "d"]
    @username = current_user.username
  end
end
