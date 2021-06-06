class UsersController < ApplicationController
  def index
    
  end

  def new
    @user = User.new
  end

  def show
    #buscamos para mostrar al usuario por ID para luego buscar todas las historias del usuario que está actualmente logeado.
    @user = User.find(params[:id])
    @user = User.includes(:stories).find(helpers.current_user.id)
  end

  def create
    @user = User.new(user_params)
    #@user.password_digest = BCrypt::Password.create(params[:user][:password])
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
