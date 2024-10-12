require "test_helper"

class BranchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @branch = branches(:one)
  end

  test "should get index" do
    get branches_url, as: :json
    assert_response :success
  end

  test "should create branch" do
    assert_difference("Branch.count") do
      post branches_url, params: { branch: { company_id: @branch.company_id, name: @branch.name } }, as: :json
    end

    assert_response :created
  end

  test "should show branch" do
    get branch_url(@branch), as: :json
    assert_response :success
  end

  test "should update branch" do
    patch branch_url(@branch), params: { branch: { company_id: @branch.company_id, name: @branch.name } }, as: :json
    assert_response :success
  end

  test "should destroy branch" do
    assert_difference("Branch.count", -1) do
      delete branch_url(@branch), as: :json
    end

    assert_response :no_content
  end
end
