class MdlContextsController < ApplicationController
  before_action :set_mdl_context, only: [:show, :edit, :update, :destroy]

  # GET /mdl_contexts
  # GET /mdl_contexts.json

def course

@mdl_context = MdlContext.select(:fullname,'co.id').joins(" INNER JOIN mdl_role_assignments  ra ON  ra.contextid =  mdl_context.id INNER JOIN mdl_course co ON co.id = mdl_context.instanceid" ).where("ra.userid = ? ", params[:id])

  if @mdl_context.nil? == true || @mdl_context.blank? == true

       render :action =>"buscar"

  else


    #render json: @mdl_context
      return @mdl_context

  end
end


def buscar

  redirect_to :action =>"buscar"

end

  def show
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
