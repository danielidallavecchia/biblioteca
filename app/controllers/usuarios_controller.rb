class UsuariosController < ApplicationController
  skip_before_filter :exigir_login, only: [:new, :create]

  before_filter :carregar_usuario, only: [:show, :edit, :update, :destroy]
  before_filter :carregar_perfis, only: [:new, :create, :edit, :update]

  def index
    @usuarios = Usuario.order("perfil_id asc, nome asc")
    
    if !params[:busca].blank?
      termo = "%#{params[:busca]}%"
      @usuarios = @usuarios.where("nome ILIKE ? OR login ILIKE ? OR email ILIKE ?", termo, termo, termo)
    end
  end

  def new
    @usuario = nil
    params[:usuario] = nil
    @usuario = Usuario.new
  end

  def show
    @usuario = Usuario.find_by_id(params[:id])
  end

  def create
    @usuario = Usuario.new(params[:usuario])

    if @usuario.perfil_id.blank?
      @usuario_perfil_padrao = UsuarioPerfil.where(eh_padrao: true).first
      @usuario.perfil_id = @usuario_perfil_padrao.id ## perfil_id default
    end

    if @usuario.save
      flash[:success] = "Usuário criado com sucesso"

      if params[:salvar_e_continuar]
        redirect_to new_usuario_path
      else 
        if @usuario.id.blank?
          redirect_to usuarios_path 
        else 
          redirect_to usuario_path(@usuario)
        end
      end

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
      redirect_to usuario_path(@usuario)
    else
      flash.now[:error] = @usuario.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy 
    @usuario = Usuario.find_by_id(params[:id])

    if tem_vinculo_emprestimo(@usuario.id)
      flash.now[:error] = "usuario_com_emprestimo"
      @usuarios = Usuario.order("perfil_id asc, nome asc")
      render :index
    elsif tem_vinculo_reserva(@usuario.id)
      flash.now[:error] = "usuario_com_reserva"
      @usuarios = Usuario.order("perfil_id asc, nome asc")
      render :index
    else
      exclui_emprestimos(@usuario.id)
      exclui_reservas(@usuario.id)
      @usuario.destroy
      redirect_to usuarios_path
    end
  end

  def tem_vinculo_emprestimo(id)
    emp = Emprestimo.where(usuario_id: id, data_devolucao: nil) # emprestimos ativos
    !emp.blank? ? true : false
  end

  def tem_vinculo_reserva(id)
    res = Reserva.where(usuario_id: id, data_expiracao: nil) # reservas ativas
    !res.blank? ? true : false
  end

  def gera_senha
    @usuario = Usuario.find_by_id(params[:id])
    
    @usuario_nova_senha = SecureRandom.hex(10)

    @usuario.update_attributes(senha: @usuario_nova_senha)
  end

  private

  def exclui_emprestimos(id)
    emprestimos = Emprestimo.where(usuario_id: id)

    if !emprestimos.blank?
      emprestimos.each do |e|
        e.destroy
      end
    end
  end

  def exclui_reservas(id)
    reservas = Reserva.where(usuario_id: id)

    if !reservas.blank?
      reservas.each do |r|
        r.destroy
      end
    end
  end

  def carregar_usuario
    @usuario = Usuario.find_by_id(params[:id])
  end

  def carregar_perfis
    @usuario_perfis = UsuarioPerfil.order(:nome)
  end
end