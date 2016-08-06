class AddImageToSnippets < ActiveRecord::Migration[5.0]
  def change
    add_column :snippets, :image, :string
  end
end
