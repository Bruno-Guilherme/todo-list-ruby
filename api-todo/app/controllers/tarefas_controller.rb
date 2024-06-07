class TarefasController < ApplicationController
  before_action :set_tarefa, only: %i[ show update destroy ]

  # GET /tarefas
  def index
    @tarefas = Tarefa.all

    render json: @tarefas
  end

  # GET /tarefas/1
  def show
    render json: @tarefa
  end

  # POST /tarefas
  def create
    @tarefa = Tarefa.new(tarefa_params)

    if @tarefa.save
      render json: @tarefa, status: :created, location: @tarefa
    else
      render json: @tarefa.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tarefas/1
  def update
    if @tarefa.update(tarefa_params)
      render json: @tarefa
    else
      render json: @tarefa.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tarefas/1
  def destroy
    @tarefa.destroy!
  end

  private
    def set_tarefa
      @tarefa = Tarefa.find(params[:id])
    end

    def tarefa_params
      params.require(:tarefa).permit(:nome, :descricao, :finalizada, :prioridade, :membro_id)
    end    
end
