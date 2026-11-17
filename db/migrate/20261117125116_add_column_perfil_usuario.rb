class AddColumnPerfilUsuario < ActiveRecord::Migration
  def up
    add_column :usuario_perfis, :eh_padrao, :boolean, :default => false
  end

  def down
    remove_column :usuario_perfis, :eh_padrao
  end

end
