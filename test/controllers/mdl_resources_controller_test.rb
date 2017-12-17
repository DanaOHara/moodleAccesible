require 'test_helper'

class MdlResourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mdl_resource = mdl_resources(:one)
  end

  test "should get index" do
    get mdl_resources_url
    assert_response :success
  end

  test "should get new" do
    get new_mdl_resource_url
    assert_response :success
  end

  test "should create mdl_resource" do
    assert_difference('MdlResource.count') do
      post mdl_resources_url, params: { mdl_resource: { course: @mdl_resource.course, display: @mdl_resource.display, displayoptions: @mdl_resource.displayoptions, filterfiles: @mdl_resource.filterfiles, intro: @mdl_resource.intro, introformat: @mdl_resource.introformat, legacyfiles: @mdl_resource.legacyfiles, legacyfileslast: @mdl_resource.legacyfileslast, name: @mdl_resource.name, revision: @mdl_resource.revision, timemodified: @mdl_resource.timemodified, tobemigrated: @mdl_resource.tobemigrated } }
    end

    assert_redirected_to mdl_resource_url(MdlResource.last)
  end

  test "should show mdl_resource" do
    get mdl_resource_url(@mdl_resource)
    assert_response :success
  end

  test "should get edit" do
    get edit_mdl_resource_url(@mdl_resource)
    assert_response :success
  end

  test "should update mdl_resource" do
    patch mdl_resource_url(@mdl_resource), params: { mdl_resource: { course: @mdl_resource.course, display: @mdl_resource.display, displayoptions: @mdl_resource.displayoptions, filterfiles: @mdl_resource.filterfiles, intro: @mdl_resource.intro, introformat: @mdl_resource.introformat, legacyfiles: @mdl_resource.legacyfiles, legacyfileslast: @mdl_resource.legacyfileslast, name: @mdl_resource.name, revision: @mdl_resource.revision, timemodified: @mdl_resource.timemodified, tobemigrated: @mdl_resource.tobemigrated } }
    assert_redirected_to mdl_resource_url(@mdl_resource)
  end

  test "should destroy mdl_resource" do
    assert_difference('MdlResource.count', -1) do
      delete mdl_resource_url(@mdl_resource)
    end

    assert_redirected_to mdl_resources_url
  end
end
