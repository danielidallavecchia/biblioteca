class GenerosController < ApplicationController

  def index
    if !params[:busca].blank?
      @generos = Genero.where("nome ILIKE ?", "%#{params[:busca]}%").order("id desc")
    else
      @generos = Genero.order("id asc")
    end
  end

  def show
    @genero = Genero.find(params[:id])
  end

  def new
    @genero = Genero.new
  end

  def create
    @genero = Genero.new(params[:genero])

    if @genero.save 
      redirect_to generos_path, notice: "sucesso"
    else 
      flash.now[:error] = "erro_create"
      render :new
    end
  end

  def edit
    @genero = Genero.find(params[:id])
  end

  def update
    @genero = Genero.find(params[:id])

    if @genero.update_attributes(params[:genero])
      redirect_to generos_path
    else
      render :edit
    end
  end

  def destroy
    @genero = Genero.find(params[:id])
    @genero.destroy

    redirect_to generos_path, notice: "sucesso"
  end

end
