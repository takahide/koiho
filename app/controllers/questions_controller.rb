class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]


  # GET /posts
  # GET /posts.json
  def index
    authenticate_user!
    @username = current_user.username
    @questions = Question.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    authenticate_user!
  end

  # GET /posts/new
  def new
    authenticate_user!
    if current_user.username != "carp_joshi"
      redirect_to action: "index"
    end
    @question = Question.new
  end

  # GET /posts/1/edit
  def edit
    authenticate_user!
    if current_user.username != "carp_joshi"
      redirect_to action: "index"
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    authenticate_user!
    if current_user.username != "carp_joshi"
      redirect_to action: "index"
    end
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @question }
      else
        format.html { render action: 'new' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    authenticate_user!
    if current_user.username != "carp_joshi"
      redirect_to action: "index"
    end
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    authenticate_user!
    if current_user.username != "carp_joshi"
      redirect_to action: "index"
    end
    @question.destroy
    respond_to do |format|
      format.html { redirect_to question_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:text, :username)
    end
end
