class MdlContextsController < ApplicationController
  before_action :set_mdl_context, only: [:show, :edit, :update, :destroy]

  # GET /mdl_contexts
  # GET /mdl_contexts.json
  def obetenerCursosPorIdUsuario
    @mdl_contexts = MdlContext.select(:fullname).joins(" INNER JOIN mdl_role_assignments  ra ON  ra.contextid =  mdl_context.id INNER JOIN mdl_course co ON co.id = mdl_context.instanceid" ).where("ra.userid = ? ", params[:userid])
  return render json: @mdl_contexts



  end

  # GET /mdl_contexts/1
  # GET /mdl_contexts/1.json
  def show
  end

  # GET /mdl_contexts/new
  def new
    @mdl_context = MdlContext.new
  end

  # GET /mdl_contexts/1/editINNER JOIN
  def edit
  end

  # POST /mdl_contexts
  # POST /mdl_contexts.json
  def create
    @mdl_context = MdlContext.new(mdl_context_params)

    respond_to do |format|
      if @mdl_context.save
        format.html { redirect_to @mdl_context, notice: 'Mdl context was successfully created.' }
        format.json { render :show, status: :created, location: @mdl_context }
      else
        format.html { render :new }
        format.json { render json: @mdl_context.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mdl_contexts/1
  # PATCH/PUT /mdl_contexts/1.json
  def update
    respond_to do |format|
      if @mdl_context.update(mdl_context_params)
        format.html { redirect_to @mdl_context, notice: 'Mdl context was successfully updated.' }
        format.json { render :show, status: :ok, location: @mdl_context }
      else
        format.html { render :edit }
        format.json { render json: @mdl_context.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mdl_contexts/1
  # DELETE /mdl_contexts/1.json
  def destroy
    @mdl_context.destroy
    respond_to do |format|
      format.html { redirect_to mdl_contexts_url, notice: 'Mdl context was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mdl_context
      @mdl_context = MdlContext.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mdl_context_params
      params.require(:mdl_context).permit(:contextlevel, :instanceid, :path, :depth)
    end
end
