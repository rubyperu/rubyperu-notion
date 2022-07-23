require "application_system_test_case"

class WorkspacesTest < ApplicationSystemTestCase
  setup do
    @workspace = workspaces(:one)
  end

  test "visiting the index" do
    visit workspaces_url
    assert_selector "h1", text: "Workspaces"
  end

  test "should create workspace" do
    visit workspaces_url
    click_on "New workspace"

    fill_in "Title", with: @workspace.title
    click_on "Create Workspace"

    assert_text "Workspace was successfully created"
    click_on "Back"
  end

  test "should update Workspace" do
    visit workspace_url(@workspace)
    click_on "Edit this workspace", match: :first

    fill_in "Title", with: @workspace.title
    click_on "Update Workspace"

    assert_text "Workspace was successfully updated"
    click_on "Back"
  end

  test "should destroy Workspace" do
    visit workspace_url(@workspace)
    click_on "Destroy this workspace", match: :first

    assert_text "Workspace was successfully destroyed"
  end
end
