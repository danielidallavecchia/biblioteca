class GenerosController < ApplicationController

  def index
    if !params[:busca].blank?
      @generos = Genero.where("nome ILIKE ?", "%#{params[:busca]}%").order("id desc")
    else
      @generos = Genero.order("id asc")
    end
  end

  def show
    @genero = Genero.find_by_id(params[:id])
  end

  def new
    @genero = Genero.new
  end

  def create
    @genero = Genero.new(params[:genero])

    if @genero.save 
      if params[:salvar_e_continuar]
        redirect_to new_genero_path
      else
        if @genero.id.blank?
          redirect_to generos_path 
        else 
          redirect_to genero_path(@genero)
        end
      end
      
    else 
      flash.now[:error] = "erro_create"
      render :new
    end
  end

  def edit
    @genero = Genero.find_by_id(params[:id])
  end

  def update
    @genero = Genero.find_by_id(params[:id])

    if @genero.update_attributes(params[:genero])
      redirect_to genero_path(@genero)
    else
      render :edit
    end
  end

  def destroy
    @genero = Genero.find_by_id(params[:id])

    if tem_vinculos(@genero.id)
      ## não permite excluir se estiver vinculado a um livro
      flash.now[:error] = "genero_em_uso"
      
      @generos = Genero.order("id asc")
      render :index
    else
      @genero.destroy
      redirect_to generos_path, notice: "sucesso"
    end
  end

  def tem_vinculos(id)
    livros = Livro.where(genero_id: id)
    !livros.blank? ? true : false
  end

end
