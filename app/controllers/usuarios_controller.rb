class UsuariosController < ApplicationController
  skip_before_filter :exigir_login, only: [:new, :create]

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
    if session[:usuario_id] == @usuario.id
      session[:usuario_id] = nil
    end

    exclui_emprestimos(@usuario.id)
    exclui_reservas(@usuario.id)

    @usuario.destroy
    flash[:success] = "Usuário removido com sucesso"
    redirect_to usuarios_path
  end

  private

  def exclui_emprestimos(id)
    emprestimos = Emprestimo.where("usuario_id = ?", id)

    if !emprestimos.blank?
      emprestimos.each do |e|
        e.destroy
      end
    end
  end

  def exclui_reservas(id)
    reservas = Reserva.where("usuario_id = ?", id)

    if !reservas.blank?
      reservas.each do |r|
        r.destroy
      end
    end
  end

  def carregar_usuario
    @usuario = Usuario.find(params[:id])
  end
end