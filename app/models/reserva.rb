class Reserva < ActiveRecord::Base 
    attr_accessible :usuario_id, :livro_id, :data_reserva, :posicao, :data_expiracao

    belongs_to :usuario # uma reserva pertence a um usuário
    belongs_to :livro # uma reserva pertence a um livro

    validates :usuario_id, :livro_id, :data_reserva, :posicao, presence: { message: "é obrigatório" }

    validate :valida_data_reserva
    validate :valida_reserva, on: :create
    validates :data_expiracao, presence: { message: "é obrigatória" }, on: :update

    def valida_data_reserva
        if !data_reserva.blank? && data_reserva > Date.today 
            errors.add("Data de reserva", "não pode ser no futuro")
        end
    end

    def valida_reserva
        if Livro.esta_reservado?(livro_id, usuario_id)
            errors.add("Livro", "já está reservado para esse usuário")
        end
    end

    # status = ATIVO ou ENCERRADO
    def status
        !data_expiracao.blank? ? "ENCERRADO" : "ATIVO"
    end

end
