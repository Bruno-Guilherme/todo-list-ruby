class CreateMembros < ActiveRecord::Migration[7.1]
  def change
    create_table :membros do |t|
      t.string :email
      t.string :nome
      t.references :tarefa, null: true, foreign_key: true
    end
  end
end
