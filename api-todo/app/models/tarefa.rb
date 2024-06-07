class Tarefa < ApplicationRecord
  VALID_FINALIZADA = [true, false]
  VALID_PRIORIDADE = ['baixa', 'media', 'alta']

  validates :nome, presence: true, length: { minimum: 5, maximum: 50 }
  validates :descricao, length: { maximum: 150 }


  validates :finalizada, inclusion: { in: VALID_FINALIZADA }


  validates :prioridade, inclusion: { in:VALID_PRIORIDADE }

  before_validation :set_default_prioridade, on: :create
  before_save :set_data_termino

  private

  def set_default_prioridade
    self.prioridade ||= VALID_PRIORIDADE.first
  end

  def set_data_termino
    self.dataTermino = Date.current if finalizada?
  end
end