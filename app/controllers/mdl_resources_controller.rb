class MdlResourcesController < ApplicationController
  before_action :set_mdl_resource, only: [:show, :edit, :update, :destroy]

  # GET /mdl_resources
  # GET /mdl_resources.json
  def index
    @mdl_resources = MdlResource.all
  end

  # GET /mdl_resources/1
  # GET /mdl_resources/1.json
  def show
  end

  # GET /mdl_resources/new
  def new
    @mdl_resource = MdlResource.new
  end

  def sinRecursos

      redirect_to :action =>"sinRecursos"

  end

  def descarga

    render :action => "descarga"

  end



  def obtenerRecursosPorCurso

    @mdl_resources = MdlResource.select(:name).where("course = ?", params[:course])

    if @mdl_resources.nil? == true || @mdl_resources.blank? == true

         render :action =>"sinRecursos"

    else

    return @mdl_resources

    end
  end



  # GET /mdl_resources/1/edit
  def edit
  end

  # POST /mdl_resources
  # POST /mdl_resources.json
  def create
    @mdl_resource = MdlResource.new(mdl_resource_params)

    respond_to do |format|
      if @mdl_resource.save
        format.html { redirect_to @mdl_resource, notice: 'Mdl resource was successfully created.' }
        format.json { render :show, status: :created, location: @mdl_resource }
      else
        format.html { render :new }
        format.json { render json: @mdl_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mdl_resources/1
  # PATCH/PUT /mdl_resources/1.json
  def update
    respond_to do |format|
      if @mdl_resource.update(mdl_resource_params)
        format.html { redirect_to @mdl_resource, notice: 'Mdl resource was successfully updated.' }
        format.json { render :show, status: :ok, location: @mdl_resource }
      else
        format.html { render :edit }
        format.json { render json: @mdl_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mdl_resources/1
  # DELETE /mdl_resources/1.json
  def destroy
    @mdl_resource.destroy
    respond_to do |format|
      format.html { redirect_to mdl_resources_url, notice: 'Mdl resource was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mdl_resource
      @mdl_resource = MdlResource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mdl_resource_params
      params.require(:mdl_resource).permit(:course, :name, :intro, :introformat, :tobemigrated, :legacyfiles, :legacyfileslast, :display, :displayoptions, :filterfiles, :revision, :timemodified)
    end
end
