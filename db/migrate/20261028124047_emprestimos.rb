class Emprestimos < ActiveRecord::Migration
  def up
    create_table :emprestimos do |t|
      t.integer :livro_id
      t.integer :usuario_id
      t.datetime :data_prevista_devolucao
      t.datetime :data_devolucao

      t.timestamps
    end
    
  end

  def down
    drop_table :emprestimos
  end
end
