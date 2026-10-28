class Genero < ActiveRecord::Base
  attr_accessible :nome
  has_many :livro

  validates :nome, presence: true
end
