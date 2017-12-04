class MdlCoursesController < ApplicationController
  before_action :set_mdl_course, only: [:show, :edit, :update, :destroy]

  # GET /mdl_courses
  # GET /mdl_courses.json
  def index
    @terminoABuscar = params[:terminoABuscar]
    @mdl_course = MdlCourse.where(:fullname => @terminoABuscar)
  end


def buscarCursosPorIdeUsuario

@mdl_courses = MdlCourse.select("fullname").from()

end
  # GET /mdl_courses/1
  # GET /mdl_courses/1.json
  def show
  end

  # GET /mdl_courses/new
  def new
    @mdl_course = MdlCourse.new
  end

  # GET /mdl_courses/1/edit
  def edit
  end

  # POST /mdl_courses
  # POST /mdl_courses.json
  def create
    @mdl_course = MdlCourse.new(mdl_course_params)

    respond_to do |format|
      if @mdl_course.save
        format.html { redirect_to @mdl_course, notice: 'Mdl course was successfully created.' }
        format.json { render :show, status: :created, location: @mdl_course }
      else
        format.html { render :new }
        format.json { render json: @mdl_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mdl_courses/1
  # PATCH/PUT /mdl_courses/1.json
  def update
    respond_to do |format|
      if @mdl_course.update(mdl_course_params)
        format.html { redirect_to @mdl_course, notice: 'Mdl course was successfully updated.' }
        format.json { render :show, status: :ok, location: @mdl_course }
      else
        format.html { render :edit }
        format.json { render json: @mdl_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mdl_courses/1
  # DELETE /mdl_courses/1.json
  def destroy
    @mdl_course.destroy
    respond_to do |format|
      format.html { redirect_to mdl_courses_url, notice: 'Mdl course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mdl_course
      @mdl_course = MdlCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mdl_course_params
      params.require(:mdl_course).permit(:category, :sortorder, :fullname, :shortname, :idnumber, :summary, :summaryformat, :format, :showgrades, :newsitems, :startdate, :marker, :maxbytes, :legacyfiles, :showreports, :visible, :visibleold, :groupmode, :groupmodeforce, :defaultgroupingid, :lang, :calendartype, :theme, :timecreated, :timemodified, :requested, :enablecompletion, :completionnotify, :cacherev)
    end
end
