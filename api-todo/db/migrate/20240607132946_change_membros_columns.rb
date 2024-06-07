class ChangeMembrosColumns < ActiveRecord::Migration[7.1]
  def change
    change_column_null :membros, :nome, false
    change_column_null :membros, :email, false
    add_index :membros, :email, unique: true
  end
end