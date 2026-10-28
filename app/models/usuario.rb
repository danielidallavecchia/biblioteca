class Usuario < ActiveRecord::Base
    attr_accessible :nome, :login, :email, :senha

    validates :nome, :login, :email, :senha, presence: true

    validates :login, :email, uniqueness: true

    validates :email, format: { 
    with: /\A[^@\s]+@[^@\s]+\z/, 
    message: "Este e-mail não tem um formato válido" 
  }
end