class MembrosController < ApplicationController
  before_action :set_membro, only: %i[ show update destroy ]

  # GET /membros
  def index
    @membros = Membro.all

    render json: @membros
  end

  # GET /membros/1
  def show
    render json: @membro
  end

  # POST /membros
  def create
    @membro = Membro.new(membro_params)

    if @membro.save
      render json: @membro, status: :created, location: @membro
    else
      render json: @membro.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /membros/1
  def update
    if @membro.update(membro_params)
      render json: @membro
    else
      render json: @membro.errors, status: :unprocessable_entity
    end
  end

  # DELETE /membros/1
  def destroy
    @membro.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_membro
      @membro = Membro.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def membro_params
      params.require(:membro).permit(:email, :nome, :tarefa_id)
    end
end
