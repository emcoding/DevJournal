class AddDefaultToRole < ActiveRecord::Migration[5.0]
  def change
    change_column_default :accounts, :role, :snipper
  end
end
