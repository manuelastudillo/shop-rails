class SessionsController < ApplicationController
	skip_before_action :require_login, except: [:destroy]

  def new
  end

def create
  if login(params[:email], params[:password], params[:remember_me])
    flash[:success] = 'Bienvenido!'
    redirect_back_or_to root_path
  else
    flash.now[:warning] = 'E-mail y/o password es incorrecto.'
    render 'new'
  end
end

  def destroy
    logout
    flash[:success] = 'Nos vemos'
    redirect_to log_in_path
  end
end