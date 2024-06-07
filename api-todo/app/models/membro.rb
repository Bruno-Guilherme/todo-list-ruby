class Membro < ApplicationRecord
  has_many :tarefas, dependent: :destroy
end
