class MdlEventsController < ApplicationController
  before_action :set_mdl_event, only: [:show, :edit, :update, :destroy]

  # GET /mdl_events
  # GET /mdl_events.json
  def index
    @mdl_events = MdlEvent.all
  end

  # GET /mdl_events/1
  # GET /mdl_events/1.json
  def show
  end



  def sinEventos

  end



  def eventosPorCurso

    @mdl_events = MdlEvent.select(:id, :name, :courseid).where("courseid = ?", params[:courseid])

    if @mdl_events.nil? == true || @mdl_events.blank? == true

         render :action =>"sinEventos"

    else

    return @mdl_events

    end
  end

  # GET /mdl_events/new
  # GET /mdl_events/new
  def new
    @mdl_event = MdlEvent.new
  end

  # GET /mdl_events/1/edit
  def edit
  end

  # POST /mdl_events
  # POST /mdl_events.json
  def create
    @mdl_event = MdlEvent.new(mdl_event_params)

    respond_to do |format|
      if @mdl_event.save
        format.html { redirect_to @mdl_event, notice: 'Mdl event was successfully created.' }
        format.json { render :show, status: :created, location: @mdl_event }
      else
        format.html { render :new }
        format.json { render json: @mdl_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mdl_events/1
  # PATCH/PUT /mdl_events/1.json
  def update
    respond_to do |format|
      if @mdl_event.update(mdl_event_params)
        format.html { redirect_to @mdl_event, notice: 'Mdl event was successfully updated.' }
        format.json { render :show, status: :ok, location: @mdl_event }
      else
        format.html { render :edit }
        format.json { render json: @mdl_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mdl_events/1
  # DELETE /mdl_events/1.json
  def destroy
    @mdl_event.destroy
    respond_to do |format|
      format.html { redirect_to mdl_events_url, notice: 'Mdl event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mdl_event
      @mdl_event = MdlEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mdl_event_params
      params.require(:mdl_event).permit(:name, :description, :format, :courseid, :groupid, :userid, :repeatid, :modulename, :instance, :eventtype, :timestart, :timeduration, :visible, :uuid, :sequence, :timemodified, :subscriptionid)
    end
end
