require 'test_helper'

class MdlRoleAssignmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mdl_role_assignment = mdl_role_assignments(:one)
  end

  test "should get index" do
    get mdl_role_assignments_url
    assert_response :success
  end

  test "should get new" do
    get new_mdl_role_assignment_url
    assert_response :success
  end

  test "should create mdl_role_assignment" do
    assert_difference('MdlRoleAssignment.count') do
      post mdl_role_assignments_url, params: { mdl_role_assignment: { component: @mdl_role_assignment.component, contextid: @mdl_role_assignment.contextid, itemid: @mdl_role_assignment.itemid, modifierid: @mdl_role_assignment.modifierid, roleid: @mdl_role_assignment.roleid, sortorder: @mdl_role_assignment.sortorder, timemodified: @mdl_role_assignment.timemodified, userid: @mdl_role_assignment.userid } }
    end

    assert_redirected_to mdl_role_assignment_url(MdlRoleAssignment.last)
  end

  test "should show mdl_role_assignment" do
    get mdl_role_assignment_url(@mdl_role_assignment)
    assert_response :success
  end

  test "should get edit" do
    get edit_mdl_role_assignment_url(@mdl_role_assignment)
    assert_response :success
  end

  test "should update mdl_role_assignment" do
    patch mdl_role_assignment_url(@mdl_role_assignment), params: { mdl_role_assignment: { component: @mdl_role_assignment.component, contextid: @mdl_role_assignment.contextid, itemid: @mdl_role_assignment.itemid, modifierid: @mdl_role_assignment.modifierid, roleid: @mdl_role_assignment.roleid, sortorder: @mdl_role_assignment.sortorder, timemodified: @mdl_role_assignment.timemodified, userid: @mdl_role_assignment.userid } }
    assert_redirected_to mdl_role_assignment_url(@mdl_role_assignment)
  end

  test "should destroy mdl_role_assignment" do
    assert_difference('MdlRoleAssignment.count', -1) do
      delete mdl_role_assignment_url(@mdl_role_assignment)
    end

    assert_redirected_to mdl_role_assignments_url
  end
end
