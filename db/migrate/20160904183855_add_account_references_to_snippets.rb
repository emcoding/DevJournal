class AddAccountReferencesToSnippets < ActiveRecord::Migration[5.0]
  def change
    add_reference :snippets, :account, foreign_key: true
  end
end
