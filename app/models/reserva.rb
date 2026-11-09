class Reserva < ActiveRecord::Base 
    attr_accessible :usuario_id, :livro_id, :data_reserva, :posicao, :data_expiracao

    belongs_to :usuario # uma reserva pertence a um usuário
    belongs_to :livro # uma reserva pertence a um livro

    validates :usuario_id, :livro_id, :data_reserva, presence: { message: "é obrigatório" }
    validates :posicao, presence: { message: "é obrigatória" }, on: :create

    validate :valida_data_reserva
    validate :valida_reserva, on: :create
    validates :data_expiracao, presence: { message: "é obrigatória" }, on: :update

    def valida_data_reserva
        if !data_reserva.blank? && data_reserva > Date.today 
            errors.add("Data de início da reserva", "não pode ser no futuro")
        end
    end

    def valida_reserva
        if Livro.esta_reservado?(livro_id, usuario_id)
            errors.add("Livro", "já está reservado para esse usuário")
        end

        if !Livro.esta_emprestado?(livro_id) # se não tiver emprestado, nao permite criar uma reserva
            errors.add("Livro", "não possui empréstimo ativo. Sua reserva não é válida")
        end

        if Livro.emprestado_para_usuario?(livro_id, usuario_id) # se já estiver emprestado pro usuario_id, nao permite reservar pro mesmo usuario
            errors.add("Livro", "já possui um emprestimo ativo para esse usuário.")
        end
    end

    # status = ATIVO ou ENCERRADO
    def status
        !data_expiracao.blank? ? "ENCERRADO" : "ATIVO"
    end

end
