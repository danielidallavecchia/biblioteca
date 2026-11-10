class Genero < ActiveRecord::Base
  attr_accessible :nome
  has_many :livros

  validates :nome, presence: { message: "é obrigatório" }, length: { maximum: 200, message: "não pode exceder 200 caracteres" }

  def id_e_nome
    "##{id} - #{nome}"
  end
end
