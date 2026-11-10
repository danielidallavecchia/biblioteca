class ConfiguracoesController < ApplicationController

  def show
    @configuracao = Configuracao.where("id > 0").first
  end

  def edit
    @configuracao = Configuracao.where("id > 0").first
  end

  def update
    @configuracao = Configuracao.where("id > 0").first

    if @configuracao.reserva_automatica.blank?
      @configuracao.reserva_automatica = false
    end

    if @configuracao.update_attributes(params[:configuracao])
      redirect_to configuracao_path
    else
      render :edit
    end
  end

end
