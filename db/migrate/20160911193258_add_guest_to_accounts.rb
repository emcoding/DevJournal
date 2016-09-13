class AddGuestToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :guest, :boolean
  end
end
