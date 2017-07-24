class UsersController < ApplicationController
  skip_before_action :require_login
  before_action :set_user, only: [:mostrar, :editar, :update, :eliminar]
  before_action :authenticate_admin!, only: [:new, :create, :update,:destroy]
  PAGE_SIZE = 10

def index
    @page = (params[:page] || 0).to_i
    @keywords = params[:keywords]

    search = Search.new(@page, PAGE_SIZE, @keywords)
    @users, @number_of_pages = search.users_by_nombre
    respond_to do |format|
    format.html
    format.pdf do
      pdf = UserPdf.new(@users)
      send_data pdf.render, filename: "usuarios.pdf", type: "application/pdf"
   end
 end
end
  def new
    @user = User.new
  end

 def show
   @user = User.find(params[:id])
end


def edit
   @user = User.find(params[:id])
end

  def create
    @user = User.new(user_params)
    if @user.save
      login(params[:user][:email], params[:user][:password])
      flash[:success] = 'Welcome!'
      redirect_to users_path
    else
      render 'new'
    end
end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_url, notice: 'Unidad Actualizada.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end



  def activate
    if @user = User.load_from_activation_token(params[:id])
      @user.activate!
      flash[:success] = 'User was successfully activated.'
      redirect_to log_in_path
    else
      flash[:warning] = 'Cannot activate this user.'
      redirect_to root_path
    end
  end


def destroy
    @user = User.find(params[:id])
    if @user.present?
      @user.destroy
    end
    redirect_to users_url
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :nombre, :apellido, :calle, :telefono, :telefono1, :rol_id, :comuna_id, :fechaingreso, :sueldo, :rut,
:admin, :vendedor)
  end
end