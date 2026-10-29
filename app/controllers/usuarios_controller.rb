class UsuariosController < ApplicationController
  before_filter :carregar_usuario, only: [:show, :edit, :update, :destroy]

  def index
    @usuarios = Usuario.order(:nome)
    if params[:busca].present?
      termo = "%#{params[:busca]}%"
      @usuarios = @usuarios.where("nome LIKE ? OR login LIKE ? OR email LIKE ?", termo, termo, termo)
    end
  end

  def new
    @usuario = Usuario.new
  end

  def show
  end

  def create
    @usuario = Usuario.new(params[:usuario])
    if @usuario.save
      flash[:success] = "Usuário criado com sucesso"
      redirect_to usuarios_path
    else
      flash.now[:error] = @usuario.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit
  end

  def update
    dados = params[:usuario]
    dados.delete(:senha) if dados[:senha].blank?

    if @usuario.update_attributes(dados)
      flash[:success] = "Usuário editado com sucesso"
      redirect_to usuarios_path
    else
      flash.now[:error] = @usuario.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @usuario.destroy
    flash[:success] = "Usuário removido com sucesso"
    redirect_to usuarios_path
  end

  private

  def carregar_usuario
    @usuario = Usuario.find(params[:id])
  end
end