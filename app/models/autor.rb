class Autor < ActiveRecord::Base 
  attr_accessible :nome, :data_nasc, :data_obito
  has_many :livros

  validates :nome, presence :true
  validates :data_nasc, presence :true
  validate :valida_datas_futuro

  def valida_datas_futuro
    if !data_nasc.blank && data_nasc > Date.today
      errors.add(:data_nasc, "não pode ser no futuro")
    end

    if !data_obito.blank && data_obito > Date.today
      errors.add(:data_obito, "não pode ser no futuro")
    end
  end

end
