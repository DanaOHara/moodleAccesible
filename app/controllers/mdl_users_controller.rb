class MdlUsersController < ApplicationController



  before_action :set_mdl_user, only: [ :edit, :update, :destroy,]

include BCrypt

  # GET /mdl_users
  # GET /mdl_users.json

  def index
    @mdl_users = MdlUser.select(:id).where("email = ?", params[:email]).where("password = ?", params[:password])

  end

  # GET /mdl_users/1
  # GET /mdl_users/1.json
  def show
    @mdl_users = MdlUser.where("email = ?", params[:email])
  end

  def emailErroneo

    redirect_to :action =>"emailErroneo"

  end




  def vcontrasena

    my_password = BCrypt::Password.create(params[:contrasena])

    @cont = '$2y$10$7gQwnERyWZXZ/PjSruFkyenTIfrcfQKMfReeLEbrtcSp2X4hVPSHW'
    @sal =  BCrypt::Engine.generate_salt(10)

    if my_password ==  BCrypt::Engine.hash_secret(@cont,@sal)

    render :json => {password: my_password}

    else
    render :json => {match:"falssssoooOOOOOOOOOOOOOoooo0o0o0o0o0"}
  end
end


  def verifEmail

  @mdl_user = MdlUser.select(:id).where("email = ?", params[:email].concat("@usach.cl"))



   if @mdl_user.nil? == true || @mdl_user.blank? == true

   render :action =>"emailErroneo"

  else
  # Por ahora la verificacion de la contrasena quedara en suspenso, con un email valido ira a los cursos del alumno
  # render :action =>"vcontrasena"
  #@mdl_id = MdlUser.select(:id).where("email = ?", params[:email].concat("@usach.cl"))
  #render json: @mdl_user
  redirect_to  controller: 'mdl_contexts', action: 'course', :id => @mdl_user.pluck(:id)
  #redirect_to url_for(:controller => 'mdl_contexts', :action => 'cursos')

   #return @mdl_id
   end
 end


  # GET /mdl_users/new
  def new
    @mdl_user = MdlUser.new
  end

  # GET /mdl_users/1/edit
  def edit
  end





  # POST /mdl_users
  # POST /mdl_users.json
  def create
    @mdl_user = MdlUser.new(mdl_user_params)

    respond_to do |format|
      if @mdl_user.save
        format.html { redirect_to @mdl_user, notice: 'Mdl user was successfully created.' }
        format.json { render :show, status: :created, location: @mdl_user }
      else
        format.html { render :new }
        format.json { render json: @mdl_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mdl_users/1
  # PATCH/PUT /mdl_users/1.json
  def update
    respond_to do |format|
      if @mdl_user.update(mdl_user_params)
        format.html { redirect_to @mdl_user, notice: 'Mdl user was successfully updated.' }
        format.json { render :show, status: :ok, location: @mdl_user }
      else
        format.html { render :edit }
        format.json { render json: @mdl_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mdl_users/1
  # DELETE /mdl_users/1.json
  def destroy
    @mdl_user.destroy
    respond_to do |format|
      format.html { redirect_to mdl_users_url, notice: 'Mdl user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mdl_user
      @mdl_user = MdlUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mdl_user_params
      params.require(:mdl_user).permit(:auth, :confirmed, :policyagreed, :deleted, :suspended, :mnethostid, :username, :password, :idnumber, :firstname, :lastname, :email, :emailstop, :icq, :skype, :yahoo, :aim, :msn, :phone1, :phone2, :institution, :department, :address, :city, :country, :lang, :calendartype, :theme, :timezone, :firstaccess, :lastaccess, :lastlogin, :currentlogin, :lastip, :secret, :picture, :url, :description, :descriptionformat, :mailformat, :maildigest, :maildisplay, :autosubscribe, :trackforums, :timecreated, :timemodified, :trustbitmask, :imagealt, :lastnamephonetic, :firstnamephonetic, :middlename, :alternatename)
    end
end
