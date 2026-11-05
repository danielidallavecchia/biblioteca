class Emprestimo < ActiveRecord::Base 
  attr_accessible :livro_id, :usuario_id, :data_prevista_devolucao, :data_devolucao, :reserva_origem_id
  belongs_to :livro
  belongs_to :usuario

  validates :livro_id, :usuario_id, presence: { message: "é obrigatório" }
  validates :data_prevista_devolucao, presence: { message: "é obrigatória" }
  validate :valida_data_prevista, on: :create

  validate :valida_livro, on: :create
  validates :data_devolucao, presence: { message: "é obrigatória" }, on: :update

  def valida_data_prevista
    if !data_prevista_devolucao.blank? && data_prevista_devolucao < Date.today 
      errors.add("Data de devolução prevista", "não pode ser no passado")
    end
  end

  # status = ATIVO, ENCERRADO ou ATRASADO
  def status
    if !data_devolucao.blank?
      "ENCERRADO"
    elsif data_prevista_devolucao < Date.today
      "ATRASADO"
    else 
      "ATIVO"
    end
  end

  def valida_livro
    if Livro.esta_emprestado?(livro_id)
      errors.add("Livro", "já está emprestado")
    end
  end

end
