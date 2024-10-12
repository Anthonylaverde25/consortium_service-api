require "test_helper"

class ConsortiaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @consortium = consortia(:one)
  end

  test "should get index" do
    get consortia_url, as: :json
    assert_response :success
  end

  test "should create consortium" do
    assert_difference("Consortium.count") do
      post consortia_url, params: { consortium: { description: @consortium.description, name: @consortium.name } }, as: :json
    end

    assert_response :created
  end

  test "should show consortium" do
    get consortium_url(@consortium), as: :json
    assert_response :success
  end

  test "should update consortium" do
    patch consortium_url(@consortium), params: { consortium: { description: @consortium.description, name: @consortium.name } }, as: :json
    assert_response :success
  end

  test "should destroy consortium" do
    assert_difference("Consortium.count", -1) do
      delete consortium_url(@consortium), as: :json
    end

    assert_response :no_content
  end
end
