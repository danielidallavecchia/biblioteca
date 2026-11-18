class UsuarioPerfisController < ApplicationController

  def index
    @usuario_perfis = UsuarioPerfil.order("id asc")

    if !params[:busca].blank?
      @usuario_perfis = @usuario_perfis.where("nome LIKE ?", "%#{params[:busca]}%")
    end

    usuario_perfil = UsuarioPerfil.where(eh_padrao: true).first

    if usuario_perfil.blank?
      @usuario_perfil_id_padrao = 2
    else 
      @usuario_perfil_id_padrao = usuario_perfil.id
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

      if params[:salvar_e_continuar]
        redirect_to new_usuario_perfil_path
      else
        if @usuario_perfil.blank?
          redirect_to usuario_perfis_path
        else
          redirect_to usuario_perfil_path(@usuario_perfil)
        end
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

    usado = Usuario.where(perfil_id: @usuario_perfil.id)

    if !usado.blank?
      @erro = "Perfil não pode ser excluído pois está vinculado a usuário(s)."
      render :show
    else
      @usuario_perfil.destroy 
      redirect_to usuario_perfis_path
    end

  end

  def altera_padrao
    @usuario_perfis = UsuarioPerfil.order("id asc")
    @usuario_perfil_padrao = UsuarioPerfil.where(eh_padrao: true).first
  end

  def atualiza_padrao
    @usuario_perfil = UsuarioPerfil.find(params[:usuario_perfil_id])

    UsuarioPerfil.update_all(eh_padrao: false)

    if @usuario_perfil.update_attributes(eh_padrao: true)
      redirect_to usuario_perfis_path
    else
      @usuario_perfis = UsuarioPerfil.order("id asc")
      @usuario_perfil_padrao = UsuarioPerfil.where(eh_padrao: true).first
      render :altera_padrao
    end
  end

end
