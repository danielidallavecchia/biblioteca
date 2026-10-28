class Livros < ActiveRecord::Migration
  def up
    create_table :livros do |t|
      t.string :titulo
      t.string :sinopse
      t.date :ano_publicacao
      t.integer :qtd_paginas
      t.integer :autor_id
      t.integer :genero_id
    
      t.timestamps
    end
    
  end

  def down
    drop_table :livros
  end
end
