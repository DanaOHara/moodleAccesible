require 'test_helper'

class MdlEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mdl_event = mdl_events(:one)
  end

  test "should get index" do
    get mdl_events_url
    assert_response :success
  end

  test "should get new" do
    get new_mdl_event_url
    assert_response :success
  end

  test "should create mdl_event" do
    assert_difference('MdlEvent.count') do
      post mdl_events_url, params: { mdl_event: { courseid: @mdl_event.courseid, description: @mdl_event.description, eventtype: @mdl_event.eventtype, format: @mdl_event.format, groupid: @mdl_event.groupid, instance: @mdl_event.instance, modulename: @mdl_event.modulename, name: @mdl_event.name, repeatid: @mdl_event.repeatid, sequence: @mdl_event.sequence, subscriptionid: @mdl_event.subscriptionid, timeduration: @mdl_event.timeduration, timemodified: @mdl_event.timemodified, timestart: @mdl_event.timestart, userid: @mdl_event.userid, uuid: @mdl_event.uuid, visible: @mdl_event.visible } }
    end

    assert_redirected_to mdl_event_url(MdlEvent.last)
  end

  test "should show mdl_event" do
    get mdl_event_url(@mdl_event)
    assert_response :success
  end

  test "should get edit" do
    get edit_mdl_event_url(@mdl_event)
    assert_response :success
  end

  test "should update mdl_event" do
    patch mdl_event_url(@mdl_event), params: { mdl_event: { courseid: @mdl_event.courseid, description: @mdl_event.description, eventtype: @mdl_event.eventtype, format: @mdl_event.format, groupid: @mdl_event.groupid, instance: @mdl_event.instance, modulename: @mdl_event.modulename, name: @mdl_event.name, repeatid: @mdl_event.repeatid, sequence: @mdl_event.sequence, subscriptionid: @mdl_event.subscriptionid, timeduration: @mdl_event.timeduration, timemodified: @mdl_event.timemodified, timestart: @mdl_event.timestart, userid: @mdl_event.userid, uuid: @mdl_event.uuid, visible: @mdl_event.visible } }
    assert_redirected_to mdl_event_url(@mdl_event)
  end

  test "should destroy mdl_event" do
    assert_difference('MdlEvent.count', -1) do
      delete mdl_event_url(@mdl_event)
    end

    assert_redirected_to mdl_events_url
  end
end
