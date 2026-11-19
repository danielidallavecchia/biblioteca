class Genero < ActiveRecord::Base
  attr_accessible :nome
  has_many :livros

  validates :nome, presence: { message: "é obrigatório" }, length: { maximum: 200, message: "não pode exceder 200 caracteres" }

  scope :ordena_lista, order("id asc")
  scope :ordena_select, order("generos.nome")
end
