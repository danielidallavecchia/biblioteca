class Livro < ActiveRecord::Base 
  attr_accessible :titulo, :sinopse, :ano_publicacao, :qtd_paginas, :autor_id, :genero_id

  belongs_to :autor # um livro pertence a somente um autor
  belongs_to :genero # um livro pertence a somente um genero

  has_many :emprestimos # um livro pode ter muitos emprestimos
  has_many :reservas  # um livro pode ter muitas reservas

  validates :titulo, presence: { message: "é obrigatório" }
  validates :sinopse, presence: { message: "é obrigatório" }
  validates :ano_publicacao, presence: { message: "é obrigatório" }
  validates :qtd_paginas, presence: { message: "é obrigatório" }
  validates :autor_id, presence: { message: "é obrigatório" }
  validates :genero_id, presence: { message: "é obrigatório" }

end
