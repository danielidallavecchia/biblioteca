class Autor < ActiveRecord::Base 
  self.table_name = "autores"
  
  attr_accessible :nome, :data_nasc, :data_obito
  has_many :livros

  validates :nome, presence: true
  validates :data_nasc, presence: true

  validate :valida_datas_futuro

  def valida_datas_futuro
    if !data_nasc.blank? && data_nasc > Date.today
      errors.add(:data_nasc, "não pode ser no futuro")
    end

    if !data_obito.blank? && data_obito > Date.today
      errors.add(:data_obito, "não pode ser no futuro")
    end

    if !data_nasc.blank? && !data_obito.blank?
      if data_obito < data_nasc
        errors.add(:data_obito, "não pode ser menor que a data de nascimento")
      end
    end

  end

  def id_e_nome
    "##{id} - #{nome}"
  end

end
