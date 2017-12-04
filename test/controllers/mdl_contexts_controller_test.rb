require 'test_helper'

class MdlContextsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mdl_context = mdl_contexts(:one)
  end

  test "should get index" do
    get mdl_contexts_url
    assert_response :success
  end

  test "should get new" do
    get new_mdl_context_url
    assert_response :success
  end

  test "should create mdl_context" do
    assert_difference('MdlContext.count') do
      post mdl_contexts_url, params: { mdl_context: { contextlevel: @mdl_context.contextlevel, depth: @mdl_context.depth, instanceid: @mdl_context.instanceid, path: @mdl_context.path } }
    end

    assert_redirected_to mdl_context_url(MdlContext.last)
  end

  test "should show mdl_context" do
    get mdl_context_url(@mdl_context)
    assert_response :success
  end

  test "should get edit" do
    get edit_mdl_context_url(@mdl_context)
    assert_response :success
  end

  test "should update mdl_context" do
    patch mdl_context_url(@mdl_context), params: { mdl_context: { contextlevel: @mdl_context.contextlevel, depth: @mdl_context.depth, instanceid: @mdl_context.instanceid, path: @mdl_context.path } }
    assert_redirected_to mdl_context_url(@mdl_context)
  end

  test "should destroy mdl_context" do
    assert_difference('MdlContext.count', -1) do
      delete mdl_context_url(@mdl_context)
    end

    assert_redirected_to mdl_contexts_url
  end
end
