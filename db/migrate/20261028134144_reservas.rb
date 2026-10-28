class Reservas < ActiveRecord::Migration
  def up
    create_table :reservas do |t|
      t.belongs_to :usuario, null: false, foreign_key: true
      t.belongs_to :livro, null: false, foreign_key: true
      t.date :data_reserva
      t.integer :posicao
      t.date :data_expiracao
      t.timestamps
  end

  def down
    drop_table :reservas
  end
end
