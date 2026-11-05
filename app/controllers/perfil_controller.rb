class PerfilController < ApplicationController

  def show
    @perfil = Perfil.find(params[:id])
  end

end
  