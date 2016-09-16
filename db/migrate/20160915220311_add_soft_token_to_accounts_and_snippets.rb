class AddSoftTokenToAccountsAndSnippets < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :soft_token, :string
    add_column :snippets, :soft_token, :string
  end
end
