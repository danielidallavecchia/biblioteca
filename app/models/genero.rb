class Genero < ActiveRecord::Base
  attr_accessible :nome
  has_many :livros

  validates :nome, presence: true

  def id_e_nome
    "##{id} - #{nome}"
  end
end
