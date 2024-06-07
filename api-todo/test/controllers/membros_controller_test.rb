require "test_helper"

class MembrosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @membro = membros(:one)
  end

  test "should get index" do
    get membros_url, as: :json
    assert_response :success
  end

  test "should create membro" do
    assert_difference("Membro.count") do
      post membros_url, params: { membro: { email: @membro.email, nome: @membro.nome, tarefa_id: @membro.tarefa_id } }, as: :json
    end

    assert_response :created
  end

  test "should show membro" do
    get membro_url(@membro), as: :json
    assert_response :success
  end

  test "should update membro" do
    patch membro_url(@membro), params: { membro: { email: @membro.email, nome: @membro.nome, tarefa_id: @membro.tarefa_id } }, as: :json
    assert_response :success
  end

  test "should destroy membro" do
    assert_difference("Membro.count", -1) do
      delete membro_url(@membro), as: :json
    end

    assert_response :no_content
  end
end
