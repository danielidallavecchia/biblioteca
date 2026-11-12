class UsuarioPerfisController < ApplicationController

  def index
    @usuario_perfis = UsuarioPerfil.order("nome asc")

    if !params[:busca].blank?
      @usuario_perfis = @usuario_perfis.where("nome LIKE ?", "%#{params[:busca]}%")
    end
  end

  def show
    @usuario_perfil = UsuarioPerfil.find(params[:id])
  end

  def new
    @usuario_perfil = UsuarioPerfil.new
  end

  def create
    @usuario_perfil = UsuarioPerfil.new(params[:usuario_perfil])

    if @usuario_perfil.save 
      if @usuario_perfil.blank?
        redirect_to usuario_perfis_path
      else
        redirect_to usuario_perfil_path(@usuario_perfil)
      end
    else 
      render :new
    end
  end 

  def edit
    @usuario_perfil = UsuarioPerfil.find(params[:id])
  end

  def update
    @usuario_perfil = UsuarioPerfil.find(params[:id])

    if @usuario_perfil.update_attributes(params[:usuario_perfil])
      redirect_to usuario_perfil_path(@usuario_perfil)
    else
      render :edit
    end
  end

  def destroy
    @usuario_perfil = UsuarioPerfil.find(params[:id])
    @usuario_perfil.destroy 

    redirect_to usuario_perfis_path
  end

end
