class Emprestimo < ActiveRecord::Base 
  attr_accessible :livro_id, :usuario_id, :data_prevista_devolucao, :data_devolucao, :reserva_origem_id
  belongs_to :livro
  belongs_to :usuario

  validates :livro_id, :usuario_id, presence: { message: "é obrigatório" }
  validates :data_prevista_devolucao, presence: { message: "é obrigatória" }
  validate :valida_data_prevista, on: :create

  validate :valida_livro, on: :create
  validates :data_devolucao, presence: { message: "é obrigatória" }, on: :update
  validate :valida_criacao_com_reserva, on: :create

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

  def valida_criacao_com_reserva
    reserva_atual = Livro.reserva_atual(livro_id)

    if !reserva_atual.blank? && reserva_atual.usuario_id != usuario_id
      errors.add("Livro", "só pode ser emprestado para usuário #{Usuario.get_nome(reserva_atual.usuario_id)}, pois este possui reserva ativa.")
    end
  end

  def self.livro_titulo(id)
    l = Livro.where(id: id).first
    l.blank? ? "ID #{id}" : l.titulo
  end

  def self.usuario_nome(id)
    u = Usuario.where(id: id).first
    u.blank? ? "ID #{id}" : u.nome
  end

end
