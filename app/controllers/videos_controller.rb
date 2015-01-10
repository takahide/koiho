require 'nokogiri'
require 'open-uri'
require 'kconv'

class VideosController < ApplicationController
  layout "plain"
  before_action :set_video, only: [:show, :edit, :update, :destroy]

  # GET /videos
  # GET /videos.json
  def index
    if current_user.nil? || current_user.username != "carp_joshi"
      redirect_to '/'
      return
    end
    @videos = Video.all
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
  end

  # GET /videos/new
  def new
    if current_user.nil? || current_user.username != "carp_joshi"
      redirect_to '/'
      return
    end
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
    if current_user.nil? || current_user.username != "carp_joshi"
      redirect_to '/'
      return
    end
  end

  # POST /videos
  # POST /videos.json
  def create
    if current_user.nil? || current_user.username != "carp_joshi"
      redirect_to '/'
      return
    end
    @video = Video.new(video_params)

    html = open("https://www.youtube.com/watch?v=#{@video.youtube_id}").read
    doc = Nokogiri::HTML(html.toutf8, nil, 'utf-8')
    @video.title = doc.css("#eow-title").text.squish
    @video.like = 0
    @video.dislike = 0

    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render action: 'show', status: :created, location: @video }
      else
        format.html { render action: 'new' }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    if current_user.nil? || current_user.username != "carp_joshi"
      redirect_to '/'
      return
    end
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    if current_user.nil? || current_user.username != "carp_joshi"
      redirect_to '/'
      return
    end
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:youtube_id, :title, :like, :dislike)
    end
end
