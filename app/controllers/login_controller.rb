class LoginController < ApplicationController
  skip_before_filter :exigir_login, only: [:index, :create]

  def index 
  end

  def create
    usuario = Usuario.where(login: params[:login], senha: params[:senha]).first

    if !usuario.blank? 
      session[:usuario_id] = usuario.id
      redirect_to livros_path
    else
      flash.now[:error] = "Login ou senha inválidos"
      render :index
    end
  end

  def destroy
    session[:usuario_id] = nil
    redirect_to login_path 
  end
  
end
