class ChangeColumnLivroDateParaInteger < ActiveRecord::Migration
  def up
    execute <<-SQL
      alter table livros
      alter column ano_publicacao type integer
      using extract(year from ano_publicacao)::integer;
    SQL

    change_column :livros, :ano_publicacao, :integer
  end

  def down
    execute <<-SQL
      alter table livros
      alter column ano_publicacao type date
      using make_date(ano_publicacao, 1, 1)::date;
    SQL

    change_column :livros, :ano_publicacao, :date
  end
  
end
