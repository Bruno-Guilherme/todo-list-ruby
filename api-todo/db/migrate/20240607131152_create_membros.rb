class CreateMembros < ActiveRecord::Migration[7.1]
  def change
    create_table :membros do |t|
      t.string :email
      t.string :nome
      t.references :tarefa, null: false, foreign_key: true

      t.timestamps
    end
  end
end
