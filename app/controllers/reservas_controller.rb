class ReservasController < ApplicationController

  before_filter :carregar_auxiliares, only: [:new, :edit, :create, :update, :index]

  def carregar_auxiliares 
    @usuarios = Usuario.order(:id)
    @livros = Livro.order(:id) 
  end

  def index 
    @reservas = Reserva.order("livro_id asc, posicao asc")

    ## filtro de busca por usuario ou livro
    if !params[:busca].blank?
      termo = "%#{params[:busca]}%"

      @reservas = @reservas.joins(:usuario, :livro).where("
        usuarios.id::TEXT LIKE ? OR usuarios.nome ILIKE ?
        OR livros.id::TEXT LIKE ? OR livros.titulo ILIKE ?
      ", termo, termo, termo, termo)
    end

    ## filtra somente reservas ativas
    if !params[:ativos].blank? && params[:ativos] == "true"
      @reservas = @reservas.where(data_expiracao: nil)
    end

    ## filtra por livro_id, usado no show do livro
    if !params[:livro_id].blank?
      @reservas = @reservas.where(livro_id: params[:livro_id]) 
    end

    ## filtra por usuario_id, usado no show do usuario
    if !params[:usuario_id].blank?
      @reservas = @reservas.where(usuario_id: params[:usuario_id]) 
    end

  end

  def show 
    @reserva = Reserva.find(params[:id])
  end

  def new 
    @reserva = Reserva.new

    if params[:livro_id]
      @reserva.livro_id = params[:livro_id]
    end

    if params[:usuario_id]
      @reserva.usuario_id = params[:usuario_id]
    end
  end

  def create 
    @reserva = Reserva.new(params[:reserva])

    @reserva.posicao = proxima_posicao(@reserva.livro_id)

    if @reserva.save
      redirect_to reservas_path 
    else
      render :new
    end
  end

  def edit 
    @reserva = Reserva.find(params[:id])
    @reserva.data_expiracao = Date.today
  end

  def update
    @reserva = Reserva.find(params[:id])
    
    if @reserva.update_attributes(params[:emprestimo])
      redirect_to reservas_path
    else
      render :edit
    end
  end

  def destroy 
    @reserva.destroy
    redirect_to reservas_path
  end

  private

  def proxima_posicao(livro_id)
      ultima_reserva = Reserva.where(livro_id: livro_id, data_expiracao: nil).order("posicao desc").first
      
      ultima_posicao = 0
      if !ultima_reserva.blank?
        ultima_posicao = ultima_reserva.posicao
      end

      if ultima_posicao.blank? || ultima_posicao < 0 
        ultima_posicao = 0
      end

      return ultima_posicao + 1
  end

end
