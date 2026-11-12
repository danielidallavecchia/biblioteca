class UsuarioPerfil < ActiveRecord::Base
  self.table_name = "usuario_perfis"

  attr_accessible :nome, :pode_escrever

  validates :nome, presence: { message: "é obrigatório" }, length: { maximum: 200, message: "não pode exceder 200 caracteres" }
  validate :valida_pode_escrever

  def pode_escrever_sim
    true
  end

  def pode_escrever_nao
    false
  end

  def valida_pode_escrever
    if pode_escrever.blank?
      pode_escrever = false
    end
  end

end
