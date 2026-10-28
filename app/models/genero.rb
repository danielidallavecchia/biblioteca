class Genero < ActiveRecord::Base
  attr_accessible :nome
  has_many :livros

  validates :nome, presence: true
end
