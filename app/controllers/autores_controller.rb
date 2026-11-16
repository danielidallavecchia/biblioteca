class AutoresController < ApplicationController

  def index
    if !params[:busca].blank?
      @autores = Autor.where("nome ILIKE ? OR EXTRACT(YEAR FROM data_nasc)::text LIKE ?", "%#{params[:busca]}%", "%#{params[:busca]}%").order("id asc")
    else
      @autores = Autor.order("id asc")
    end
  end

  def show
    @autor = Autor.find(params[:id])
  end

  def new
    @autor = Autor.new
  end

  def create
    @autor = Autor.new(params[:autor])

    if @autor.save 
      if @autor.id.blank?
        redirect_to autores_path
      else 
        redirect_to autor_path(@autor)
      end
    else 
      flash.now[:error] = "erro_create"
      render :new
    end
  end

  def edit
    @autor = Autor.find(params[:id])
  end

  def update
    @autor = Autor.find(params[:id])

    if @autor.update_attributes(params[:autor])
      redirect_to autor_path(@autor)
    else
      render :edit
    end
  end

  def destroy
    @autor = Autor.find(params[:id])

    if tem_vinculos(@autor.id)
      ## não permite excluir se estiver vinculado a um livro
      flash.now[:error] = "autor_em_uso"
      
      @autores = Autor.order("id asc")
      render :index
    else
      @autor.destroy
      redirect_to autores_path, notice: "sucesso"
    end
  end

  def tem_vinculos(id)
    livros = Livro.where(autor_id: id)
    !livros.blank? ? true : false
  end

end
