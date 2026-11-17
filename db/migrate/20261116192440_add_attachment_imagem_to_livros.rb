class AddAttachmentImagemToLivros < ActiveRecord::Migration
  def up
    change_table :livros do |t|
      t.attachment :imagem
    end
  end

  def down
    remove_attachment :livros, :imagem
  end
end
