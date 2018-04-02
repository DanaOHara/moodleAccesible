class MdlForumsController < ApplicationController
  before_action :set_mdl_forum, only: [:show, :edit, :update, :destroy]

  # GET /mdl_forums
  # GET /mdl_forums.json
  def index
    @mdl_forums = MdlForum
  end

  def forosPorCurso

    @mdl_forums = MdlForum.select(:id,:course,:name).where("course = ?", params[:course])

    if @mdl_forums.nil? == true || @mdl_forums.blank? == true

      render :action =>"sinForos"

    else
    return  @mdl_forums
    end
  end


  def sinForos

  redirect_to :action =>"sinForos"

  end


  # GET /mdl_forums/1
  # GET /mdl_forums/1.json
  def show
  end

  # GET /mdl_forums/new
  def new
    @mdl_forum = MdlForum.new
  end

  # GET /mdl_forums/1/edit
  def edit
  end

  # POST /mdl_forums
  # POST /mdl_forums.json
  def create
    @mdl_forum = MdlForum.new(mdl_forum_params)

    respond_to do |format|
      if @mdl_forum.save
        format.html { redirect_to @mdl_forum, notice: 'Mdl forum was successfully created.' }
        format.json { render :show, status: :created, location: @mdl_forum }
      else
        format.html { render :new }
        format.json { render json: @mdl_forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mdl_forums/1
  # PATCH/PUT /mdl_forums/1.json
  def update
    respond_to do |format|
      if @mdl_forum.update(mdl_forum_params)
        format.html { redirect_to @mdl_forum, notice: 'Mdl forum was successfully updated.' }
        format.json { render :show, status: :ok, location: @mdl_forum }
      else
        format.html { render :edit }
        format.json { render json: @mdl_forum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mdl_forums/1
  # DELETE /mdl_forums/1.json
  def destroy
    @mdl_forum.destroy
    respond_to do |format|
      format.html { redirect_to mdl_forums_url, notice: 'Mdl forum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mdl_forum
      @mdl_forum = MdlForum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mdl_forum_params
      params.require(:mdl_forum).permit(:course, :name, :intro, :introformat, :assessed, :assesstimestart, :assesstimefinish, :scale, :maxbytes, :maxattachments, :forcesubscribe, :trackingtype, :rsstype, :rssarticles, :timemodified, :warnafter, :blockafter, :blockperiod, :completiondiscussions, :completionreplies, :completionposts, :displaywordcount)
    end
end
