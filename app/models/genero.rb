class Genero < ActiveRecord::Base
  attr_accessible :nome
  belongs_to :livro

  validates :nome, presence: true
end
