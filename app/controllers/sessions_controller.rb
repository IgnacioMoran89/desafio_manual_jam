class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    pass = BCrypt::Password.new(@user.password_digest)
    
    if @user.present? && pass == params[:user][:password]
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Logeado correctamente'
    else
      flash.now[:alert] = 'Email o password inválidos'
      render :new
    end
  end

#metodo para SIGN OUT
  def destroy
    reset_session
    redirect_to root_path
  end
end
