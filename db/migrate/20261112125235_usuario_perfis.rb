class UsuarioPerfis < ActiveRecord::Migration
  def up
    create_table :usuario_perfis do |t|
      t.string :nome
      t.boolean :pode_escrever, :default => false # true indica que esse perfil pode fazer create/update, false indica que só pode ler
    
      t.timestamps
    end

    add_column :usuarios, :perfil_id, :integer 
  end

  def down
    remove_column :usuarios, :perfil_id
    drop_table :usuario_perfis
  end
end
