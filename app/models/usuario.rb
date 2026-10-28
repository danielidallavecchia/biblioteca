class Usuario < ActiveRecord::Base
    attr_accessible :nome, :login, :email, :senha

    validates :nome, :login, :email, :senha, presence: true

    validates :login, :email, uniqueness: true

    has_many :reservas # um usuario tem muitas reservas
    has_many :emprestimos # um usuario tem muitos emprestimos

    validates :email, format: { 
    with: /\A[^@\s]+@[^@\s]+\z/, 
    message: "Este e-mail não tem um formato válido" 
  }
end