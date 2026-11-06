class LivrosController < ApplicationController

  before_filter :carregar_auxiliares, only: [:new, :edit, :create, :update]

  def carregar_auxiliares
    @autores = Autor.order(:id)
    @generos = Genero.order(:id) 
  end

  def index
    if !params[:busca].blank?
      termo = "%#{params[:busca]}%"
      @livros = Livro.where("titulo ILIKE ? OR ano_publicacao::text LIKE ?", termo, termo).order("id asc")
    else
      @livros = Livro.order("id asc")
    end
  end

  def show 
    @livro = Livro.find(params[:id])
  end

  def new
    @livro = Livro.new 
  end

  def create 
    @livro = Livro.new(params[:livro])

    if @livro.save 
      redirect_to livros_path
    else
      flash.now[:error] = "erro_create"
      render :new
    end
  end

  def edit 
    @livro = Livro.find(params[:id])
  end

  def update 
    @livro = Livro.find(params[:id])

    if @livro.update_attributes(params[:livro])
      redirect_to livros_path
    else
      render :edit
    end
  end

  def destroy 
    exclui_emprestimos(params[:id])
    exclui_reservas(params[:id])

    @livro = Livro.find(params[:id])
    @livro.destroy 

    redirect_to livros_path
  end

  def info 
    @livro = Livro.find(params[:id]) 
  end
  
   def exclui_emprestimos(id)
    emprestimos = Emprestimo.where("livro_id = ?", id)

    if !emprestimos.blank?
      emprestimos.each do |e|
        e.destroy
      end
    end
  end

  def exclui_reservas(id)
    reservas = Reserva.where("livro_id = ?", id)
    
    if !reservas.blank?
      reservas.each do |r|
        r.destroy
      end
    end
  end
  
end
