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
  end

  def update 
    @emprestimo = Emprestimo.find(params[:id])

    if @emprestimo.update_attributes(params[:emprestimo])
      redirect_to emprestimos_path
    else
      render :edit
    end
  end

end
