class AddImagemUrlToLivros < ActiveRecord::Migration
  def up
    add_column :livros, :imagem_url, :string
  end

  def down
    remove_column :livros, :imagem_url
  end
end
