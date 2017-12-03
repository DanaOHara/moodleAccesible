class MdlForumDiscussionsController < ApplicationController
  before_action :set_mdl_forum_discussion, only: [:show, :edit, :update, :destroy]

  # GET /mdl_forum_discussions
  # GET /mdl_forum_discussions.json
  def index
    @mdl_forum_discussions = MdlForumDiscussion.all
  end

  # GET /mdl_forum_discussions/1
  # GET /mdl_forum_discussions/1.json
  def show
  end

  # GET /mdl_forum_discussions/new
  def new
    @mdl_forum_discussion = MdlForumDiscussion.new
  end

  # GET /mdl_forum_discussions/1/edit
  def edit
  end

  def obtenerDiscusionesPorForo

  @mdl_forum_discussions = MdlForumDiscussion.where("forum = ?", params[:forum])
  return render json: @mdl_forum_discussions

  end





  # POST /mdl_forum_discussions
  # POST /mdl_forum_discussions.json
  def create
    @mdl_forum_discussion = MdlForumDiscussion.new(mdl_forum_discussion_params)

    respond_to do |format|
      if @mdl_forum_discussion.save
        format.html { redirect_to @mdl_forum_discussion, notice: 'Mdl forum discussion was successfully created.' }
        format.json { render :show, status: :created, location: @mdl_forum_discussion }
      else
        format.html { render :new }
        format.json { render json: @mdl_forum_discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mdl_forum_discussions/1
  # PATCH/PUT /mdl_forum_discussions/1.json
  def update
    respond_to do |format|
      if @mdl_forum_discussion.update(mdl_forum_discussion_params)
        format.html { redirect_to @mdl_forum_discussion, notice: 'Mdl forum discussion was successfully updated.' }
        format.json { render :show, status: :ok, location: @mdl_forum_discussion }
      else
        format.html { render :edit }
        format.json { render json: @mdl_forum_discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mdl_forum_discussions/1
  # DELETE /mdl_forum_discussions/1.json
  def destroy
    @mdl_forum_discussion.destroy
    respond_to do |format|
      format.html { redirect_to mdl_forum_discussions_url, notice: 'Mdl forum discussion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mdl_forum_discussion
      @mdl_forum_discussion = MdlForumDiscussion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mdl_forum_discussion_params
      params.require(:mdl_forum_discussion).permit(:course, :forum, :name, :firstpost, :userid, :groupid, :assessed, :timemodified, :usermodified, :timestart, :timeend)
    end
end
