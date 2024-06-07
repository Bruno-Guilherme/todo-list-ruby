class CreateTarefas < ActiveRecord::Migration[7.1]
  def change
    create_table :tarefas do |t|
      t.string :nome, null: false, limit: 50
      t.text :descricao, limit: 150
      t.boolean :finalizada, null: false, default: false
      t.date :dataTermino
      t.string :prioridade, null: false, default: 'baixa'
    end
  end
end
