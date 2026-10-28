class Reserva < ActiveRecord::Base 
attr_accessible :usuario_id, :livro_id, :data_reserva, :posicao, :data_expiracao

    belongs_to :usuario # uma reserva pertence a um usuário
    belongs_to :livro # uma reserva pertence a um livro

    validates :usuario, :livro, :data_reserva, presence: true
end