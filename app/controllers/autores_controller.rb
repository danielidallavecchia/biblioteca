class AutoresController < ApplicationController

  def index 
    @autores = Autor.order("id asc")
  end

  # def index
  #   if !params[:busca].blank?
  #     termo = "%#{params[:busca]}%"

  #     @autores = Autor.where("nome ILIKE ?", termo).order("id desc")
  #   else
  #     @autores = Autor.order("id asc")
  #   end
  # end

  def show
    @autor = Autor.find(params[:id])
  end

  def new
    @autor = Autor.new
  end

  def create
    @autor = Autor.new(params[:genero])

    if @autor.save 
      redirect_to autores_path, notice: "sucesso"
    else 
      flash.now[:error] = "erro_create"
      render :new
    end
  end

  # def edit
  #   @autor = Autor.find(params[:id])
  # end

  # def update
  #   @autor = Autor.find(params[:id])

  #   if @autor.update_attributes(params[:autor])
  #     redirect_to autores_path
  #   else
  #     render :edit
  #   end
  # end

  # def destroy
  #   @autor = Autor.find(params[:id])
  #   @autor.destroy

  #   redirect_to autores_path, notice: "sucesso"
  # end

end
