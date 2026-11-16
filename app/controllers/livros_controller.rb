class LivrosController < ApplicationController

  before_filter :carregar_auxiliares, only: [:new, :edit, :create, :update]

  def carregar_auxiliares
    @autores = Autor.order(:id)
    @generos = Genero.order(:id) 
  end

  def index
    @livros = Livro.joins(:autor, :genero).order("livros.id ASC")

    if !params[:autor_id].blank?
      @livros = @livros.where(autor_id: params[:autor_id])
      @autor_filtrado = Autor.find_by_id(params[:autor_id])
    end

    if !params[:genero_id].blank?
      @livros = @livros.where(genero_id: params[:genero_id])
      @genero_filtrado = Genero.find_by_id(params[:genero_id])
    end
  
    if !params[:busca].blank?
      termo = "%#{params[:busca]}%"
      
      @livros = @livros.where(
        "livros.titulo ILIKE :termo OR generos.nome ILIKE :termo OR autores.nome ILIKE :termo", 
        termo: termo
      )
    end

    ## filtra somente livros que estão emprestados
    if !params[:emprestados].blank? && params[:emprestados] == "true"
      @emps = Emprestimo.where(data_devolucao: nil)

      if @emps.blank?
        @livros = []
      elsif
        ids = []
        @emps.each do |e|
          ids << e.livro_id
        end

        @livros = @livros.where("livros.id in (?)", ids).order("livros.id asc")
      end
    end

    @tem_livros = @livros.length > 0
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

      if params[:salvar_e_continuar]
        redirect_to new_livro_path
      else
        if @livro.id.blank?
          redirect_to livros_path 
        else 
          redirect_to info_livro_path(@livro)
        end
      end

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
      redirect_to info_livro_path(@livro)
    else
      render :edit
    end
  end

  def destroy 
    @livro = Livro.find(params[:id])

    if tem_vinculo_emprestimo(@livro.id)
      ## não permite excluir se estiver vinculado a emprestimo ativo
      flash.now[:error] = "livro_em_uso_emprestimo"
      
      @livros = Livro.joins(:autor, :genero).order("livros.id ASC")
      render :index

    elsif tem_vinculo_reserva(@livro.id)
      ## não permite excluir se estiver vinculado a reserva ativa
      flash.now[:error] = "livro_em_uso_reserva"

      @livros = Livro.joins(:autor, :genero).order("livros.id ASC")
      render :index

    else 
      exclui_emprestimos(params[:id])
      exclui_reservas(params[:id])

      @livro.destroy 

      redirect_to livros_path
    end
  end

  def tem_vinculo_emprestimo(id)
    emp = Emprestimo.where(livro_id: id, data_devolucao: nil) # emprestimos ativos
    !emp.blank? ? true : false
  end

  def tem_vinculo_reserva(id)
    res = Reserva.where(livro_id: id, data_expiracao: nil) # reservas ativas
    !res.blank? ? true : false
  end

  def info 
    @livro = Livro.find(params[:id]) 
    @livros_com_mesmo_autor = Livro.where("autor_id = ? and id <> ?", @livro.autor_id, @livro.id).order("id asc")
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