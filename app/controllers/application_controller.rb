class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :exigir_login

  helper_method :usuario_logado, :logado?

  def usuario_logado
    if session[:usuario_id]
      @usuario_logado = Usuario.find(session[:usuario_id]) 
    end
  end

  def logado? 
    usuario_logado.blank? ? false : true
  end

  def exigir_login
    if session[:usuario_id].blank?
      redirect_to login_path, alert: "Faça login para continuar" 
    end 
  end

end
