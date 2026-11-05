class ReservasController < ApplicationController

  before_filter :carregar_auxiliares, only: [:new, :edit, :create, :update, :index]

  def carregar_auxiliares 
    @usuarios = Usuario.order(:id)
    @livros = Livro.order(:id) 
  end

  def index 
    @reservas = Reserva.order("livro_id asc, posicao asc, id asc")

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

    @reservas_por_livro = Reserva.where(livro_id: @reserva.livro_id, data_expiracao: nil).order("posicao desc")
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
  end

  def update
  end

  def destroy 
    @reserva = Reserva.find(params[:id])

    reordena_posicao(@reserva.livro_id, @reserva.id)
    
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

  def reordena_posicao(livro_id, id)
    Reserva.where(livro_id: livro_id, data_expiracao: nil)
      .where("id > ?", id)
      .update_all("posicao = posicao - 1")
  end

end
