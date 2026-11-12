class UsuarioPerfil < ActiveRecord::Base
  self.table_name = "usuario_perfis"

  attr_accessible :nome, :pode_escrever

  validates :nome, presence: { message: "é obrigatório" }, length: { maximum: 200, message: "não pode exceder 200 caracteres" }
  validates :pode_escrever, presence: { message: "é obrigatório" }

end
