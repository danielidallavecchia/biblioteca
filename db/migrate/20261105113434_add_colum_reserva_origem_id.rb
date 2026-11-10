class AddColumReservaOrigemId < ActiveRecord::Migration
  def up
    add_column :emprestimos, :reserva_origem_id, :integer # indica qual reserva originou o emprestimo, se houver
  end

  def down
    remove_column :emprestimos, :reserva_origem_id
  end
end
