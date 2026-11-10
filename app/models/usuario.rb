class Usuario < ActiveRecord::Base
    attr_accessible :nome, :login, :email, :senha

    validates :nome, :email, presence: { message: "é obrigatório" }, length: { maximum: 255, message: "não pode exceder 255 caracteres" }
    validates :login, presence: { message: "é obrigatório" }, length: { maximum: 20, message: "não pode exceder 20 caracteres" }
    validates :senha, presence: { message: "é obrigatória" }, length: { minimum: 4, maximum: 20, message: "deve ter entre 4 e 20 caracteres" }

    validates :login, :email, uniqueness: true

    validates :email, format: { 
    with: /\A[^@\s]+@[^@\s]+\z/, 
    message: "Este e-mail não tem um formato válido" 
  }

  def id_e_nome
    "##{id} - #{nome}"
  end
  
end