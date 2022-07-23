require "test_helper"

class WorkspacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @workspace = workspaces(:one)
  end

  test "should get index" do
    get workspaces_url
    assert_response :success
  end

  test "should get new" do
    get new_workspace_url
    assert_response :success
  end

  test "should create workspace" do
    assert_difference("Workspace.count") do
      post workspaces_url, params: { workspace: { title: @workspace.title } }
    end

    assert_redirected_to workspace_url(Workspace.last)
  end

  test "should show workspace" do
    get workspace_url(@workspace)
    assert_response :success
  end

  test "should get edit" do
    get edit_workspace_url(@workspace)
    assert_response :success
  end

  test "should update workspace" do
    patch workspace_url(@workspace), params: { workspace: { title: @workspace.title } }
    assert_redirected_to workspace_url(@workspace)
  end

  test "should destroy workspace" do
    assert_difference("Workspace.count", -1) do
      delete workspace_url(@workspace)
    end

    assert_redirected_to workspaces_url
  end
end
