class PerfilController < ApplicationController
  def show
    @usuario = Usuario.find_by_id(params[:id]) ||
              Usuario.find_by_id(session[:usuario_id]) ||
              Usuario.first
  end
end