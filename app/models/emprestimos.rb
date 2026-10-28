class Emprestimos < ActiveRecord::Base 
  attr_accessible :livro_id, :usuario_id, :data_prevista_devolucao, :data_devolucao

  validates :livro_id, :usuario_id, :data_prevista_devolucao, presence: true
  validate :valida_data_prevista

  def valida_data_prevista
    if !data_prevista_devolucao.blank? && data_prevista_devolucao < Date.today 
      errors.add(:data_nasc, "não pode ser no passado")
    end
  end
end
