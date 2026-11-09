class Configuracoes < ActiveRecord::Migration
  def up
    create_table :configuracoes do |t|
      t.boolean :reserva_automatica, :default => true
    
      t.timestamps
    end
     
  end

  def down
    drop_table :configuracoes
  end
end
