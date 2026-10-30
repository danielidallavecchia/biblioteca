class EmprestimosController < ApplicationController

  before_filter :carregar_auxiliares, only: [:new, :edit, :create, :update]

  def carregar_auxiliares
    @usuarios = Usuario.order(:id)
    @livros = Livro.order(:id) 
  end

  def index 
    @emprestimos = Emprestimo.order("id desc")

    if !params[:busca].blank?
      termo = "%#{params[:busca]}%"
      @emprestimos = @emprestimos.where("EXTRACT(YEAR FROM data_prevista_devolucao)::text LIKE ?", termo)  
      @emprestimos = @emprestimos.where("EXTRACT(MONTH FROM data_prevista_devolucao)::text LIKE ?", termo)
      @emprestimos = @emprestimos.where("EXTRACT(DAY FROM data_prevista_devolucao)::text LIKE ?", termo)
    end

    # if !params[:id_usuario].blank?
    #   @emprestimos = @emprestimos.joins(:usuario).where(usuarios: { usuario_id: :id_usuario} )
    # end

    # if !params[:id_livro].blank?
    #   @emprestimos = @emprestimos.joins(:livro).where(livros: { livro_id: :id_livro} )
    # end

  end

  def show 
    @emprestimo = Emprestimo.find(params[:id])
  end

  def new 
    @emprestimo = Emprestimo.new
  end

  def create 
    @emprestimo = Emprestimo.new(params[:autor])

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
