class MdlRoleAssignmentsController < ApplicationController
  before_action :set_mdl_role_assignment, only: [:show, :edit, :update, :destroy]

  # GET /mdl_role_assignments
  # GET /mdl_role_assignments.json
  def index
    @mdl_role_assignments = MdlRoleAssignment.all
  end

  # GET /mdl_role_assignments/1
  # GET /mdl_role_assignments/1.json
  def show
  end

  # GET /mdl_role_assignments/new
  def new
    @mdl_role_assignment = MdlRoleAssignment.new
  end

  # GET /mdl_role_assignments/1/edit
  def edit
  end

  # POST /mdl_role_assignments
  # POST /mdl_role_assignments.json
  def create
    @mdl_role_assignment = MdlRoleAssignment.new(mdl_role_assignment_params)

    respond_to do |format|
      if @mdl_role_assignment.save
        format.html { redirect_to @mdl_role_assignment, notice: 'Mdl role assignment was successfully created.' }
        format.json { render :show, status: :created, location: @mdl_role_assignment }
      else
        format.html { render :new }
        format.json { render json: @mdl_role_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mdl_role_assignments/1
  # PATCH/PUT /mdl_role_assignments/1.json
  def update
    respond_to do |format|
      if @mdl_role_assignment.update(mdl_role_assignment_params)
        format.html { redirect_to @mdl_role_assignment, notice: 'Mdl role assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @mdl_role_assignment }
      else
        format.html { render :edit }
        format.json { render json: @mdl_role_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mdl_role_assignments/1
  # DELETE /mdl_role_assignments/1.json
  def destroy
    @mdl_role_assignment.destroy
    respond_to do |format|
      format.html { redirect_to mdl_role_assignments_url, notice: 'Mdl role assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mdl_role_assignment
      @mdl_role_assignment = MdlRoleAssignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mdl_role_assignment_params
      params.require(:mdl_role_assignment).permit(:roleid, :contextid, :userid, :timemodified, :modifierid, :component, :itemid, :sortorder)
    end
end
