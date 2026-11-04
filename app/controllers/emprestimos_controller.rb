class EmprestimosController < ApplicationController

  before_filter :carregar_auxiliares, only: [:new, :edit, :create, :update, :index]

  def carregar_auxiliares
    @usuarios = Usuario.order(:id)
    @livros = Livro.order(:id) 
  end

  def index 
    @emprestimos = Emprestimo.order("id desc")

    ## filtro de busca por usuario ou livro
    if !params[:busca].blank?
      termo = "%#{params[:busca]}%"

      @emprestimos = @emprestimos.joins(:usuario, :livro).where("
        usuarios.id::TEXT LIKE ? OR usuarios.nome ILIKE ?
        OR livros.id::TEXT LIKE ? OR livros.titulo ILIKE ?
      ", termo, termo, termo, termo)
    end

    ## filtra somente emprestimos ativos
    if !params[:ativos].blank? && params[:ativos] == "true"
      @emprestimos = @emprestimos.where(data_devolucao: nil)
    end

    ## filtra por livro_id, usado no show do livro
    if !params[:livro_id].blank?
      @emprestimos = @emprestimos.where(livro_id: params[:livro_id]) 
    end

    ## filtra por usuario_id, usado no show do usuario
    if !params[:usuario_id].blank?
      @emprestimos = @emprestimos.where(usuario_id: params[:usuario_id]) 
    end

  end

  def show 
    @emprestimo = Emprestimo.find(params[:id])
  end

  def new 
    @emprestimo = Emprestimo.new

    if params[:livro_id]
      @emprestimo.livro_id = params[:livro_id]
    end

    if params[:usuario_id]
      @emprestimo.usuario_id = params[:usuario_id]
    end
    
  end

  def create 
    @emprestimo = Emprestimo.new(params[:emprestimo])

    if @emprestimo.save
      redirect_to emprestimos_path 
    else
      flash.now[:error] = "erro_create"
      render :new
    end
  end

  def edit 
    @emprestimo = Emprestimo.find(params[:id])
    
    # @emprestimo.data_devolucao = Date.today
    @emprestimo.data_devolucao = Time.current

    @primeira_reserva = primeira_reserva
  end

  def update 
    @emprestimo = Emprestimo.find(params[:id])

    if @emprestimo.update_attributes(params[:emprestimo])

      @primeira_reserva = primeira_reserva

      if !@primeira_reserva.blank?
        atualiza_reserva # a) setar na reserva data_expiracao=now e posicao=null
        reordena_posicao_reservas # b) reordenar posicao de todas as reservas daquele livro
        cria_emprestimo # c) criar novo emprestimo com dados de @primeira_reserva
      end

      redirect_to emprestimos_path
    else
      render :edit
    end
  end

  private
  
  def primeira_reserva
    Reserva.where(livro_id: @emprestimo.livro_id, data_expiracao: nil).order("posicao asc").first
  end

  def atualiza_reserva
    @primeira_reserva.update_attributes(data_expiracao: Date.today, posicao: nil)
  end

  def reordena_posicao_reservas
    Reserva.where(livro_id: @primeira_reserva.livro_id, data_expiracao: nil)
      .where("posicao is not null")
      .update_all("posicao = posicao - 1")
  end

  def cria_emprestimo
    novo_emprestimo = Emprestimo.new(
      livro_id: @primeira_reserva.livro_id,
      usuario_id: @primeira_reserva.usuario_id,
      data_prevista_devolucao: Date.today + 15
    )
    novo_emprestimo.save
  end

end
