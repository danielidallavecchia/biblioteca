class Genero < ActiveRecord::Base
  attr_accessible :nome
  has_many :livros

  validates :nome, presence: { message: "é obrigatório" }

  def id_e_nome
    "##{id} - #{nome}"
  end
end
