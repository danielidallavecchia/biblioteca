class Configuracao < ActiveRecord::Base 
  self.table_name = "configuracoes"

  attr_accessible :reserva_automatica

  # validates :reserva_automatica, presence: { message: "é obrigatório" }
  validate :valida_reserva_automatica

  def reserva_auto_sim
    true
  end

  def reserva_auto_nao
    false
  end

  def valida_reserva_automatica
    if reserva_automatica.blank?
      reserva_automatica = false
    end 
  end

end
