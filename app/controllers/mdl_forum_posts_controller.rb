class MdlForumPostsController < ApplicationController
  before_action :set_mdl_forum_post, only: [:show, :edit, :update, :destroy]

  # GET /mdl_forum_posts
  # GET /mdl_forum_posts.json
  def index
    @mdl_forum_posts = MdlForumPost.all
  end

  # GET /mdl_forum_posts/1
  # GET /mdl_forum_posts/1.json
  def show
  end

  # GET /mdl_forum_posts/new
  def new
    @mdl_forum_post = MdlForumPost.new
  end

  # GET /mdl_forum_posts/1/edit
  def edit
  end

  def postPorDiscusionPrincipal

    @mdl_forum_posts = MdlForumPost.select(:message, :subject, :discussion).where('discussion = ? ', params[:discussion]).where(parent: 0)
    return  @mdl_forums_posts

  end


  def postRespuestas

    @mdl_forum_posts = MdlForumPost.select(:message).where('discussion = ? ', params[:discussion]).where('parent != 0')

      if @mdl_forum_posts.nil? == true || @mdl_forum_posts.blank? == true

        render :action =>"sinPosts"

      else

        return render json: @mdl_forum_posts

    end
  end

def sinPosts

  redirect_to :action =>"sinPosts"

end



  # POST /mdl_forum_posts
  # POST /mdl_forum_posts.json
  def create
    @mdl_forum_post = MdlForumPost.new(mdl_forum_post_params)

    respond_to do |format|
      if @mdl_forum_post.save
        format.html { redirect_to @mdl_forum_post, notice: 'Mdl forum post was successfully created.' }
        format.json { render :show, status: :created, location: @mdl_forum_post }
      else
        format.html { render :new }
        format.json { render json: @mdl_forum_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mdl_forum_posts/1
  # PATCH/PUT /mdl_forum_posts/1.json
  def update
    respond_to do |format|
      if @mdl_forum_post.update(mdl_forum_post_params)
        format.html { redirect_to @mdl_forum_post, notice: 'Mdl forum post was successfully updated.' }
        format.json { render :show, status: :ok, location: @mdl_forum_post }
      else
        format.html { render :edit }
        format.json { render json: @mdl_forum_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mdl_forum_posts/1
  # DELETE /mdl_forum_posts/1.json
  def destroy
    @mdl_forum_post.destroy
    respond_to do |format|
      format.html { redirect_to mdl_forum_posts_url, notice: 'Mdl forum post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mdl_forum_post
      @mdl_forum_post = MdlForumPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mdl_forum_post_params
      params.require(:mdl_forum_post).permit(:discussion, :parent, :userid, :created, :modified, :mailed, :subject, :message, :messageformat, :messagetrust, :attachment, :totalscore, :mailnow)
    end
end
