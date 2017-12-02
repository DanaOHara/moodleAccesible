require 'test_helper'

class MdlForumDiscussionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mdl_forum_discussion = mdl_forum_discussions(:one)
  end

  test "should get index" do
    get mdl_forum_discussions_url
    assert_response :success
  end

  test "should get new" do
    get new_mdl_forum_discussion_url
    assert_response :success
  end

  test "should create mdl_forum_discussion" do
    assert_difference('MdlForumDiscussion.count') do
      post mdl_forum_discussions_url, params: { mdl_forum_discussion: { assessed: @mdl_forum_discussion.assessed, course: @mdl_forum_discussion.course, firstpost: @mdl_forum_discussion.firstpost, forum: @mdl_forum_discussion.forum, groupid: @mdl_forum_discussion.groupid, name: @mdl_forum_discussion.name, timeend: @mdl_forum_discussion.timeend, timemodified: @mdl_forum_discussion.timemodified, timestart: @mdl_forum_discussion.timestart, userid: @mdl_forum_discussion.userid, usermodified: @mdl_forum_discussion.usermodified } }
    end

    assert_redirected_to mdl_forum_discussion_url(MdlForumDiscussion.last)
  end

  test "should show mdl_forum_discussion" do
    get mdl_forum_discussion_url(@mdl_forum_discussion)
    assert_response :success
  end

  test "should get edit" do
    get edit_mdl_forum_discussion_url(@mdl_forum_discussion)
    assert_response :success
  end

  test "should update mdl_forum_discussion" do
    patch mdl_forum_discussion_url(@mdl_forum_discussion), params: { mdl_forum_discussion: { assessed: @mdl_forum_discussion.assessed, course: @mdl_forum_discussion.course, firstpost: @mdl_forum_discussion.firstpost, forum: @mdl_forum_discussion.forum, groupid: @mdl_forum_discussion.groupid, name: @mdl_forum_discussion.name, timeend: @mdl_forum_discussion.timeend, timemodified: @mdl_forum_discussion.timemodified, timestart: @mdl_forum_discussion.timestart, userid: @mdl_forum_discussion.userid, usermodified: @mdl_forum_discussion.usermodified } }
    assert_redirected_to mdl_forum_discussion_url(@mdl_forum_discussion)
  end

  test "should destroy mdl_forum_discussion" do
    assert_difference('MdlForumDiscussion.count', -1) do
      delete mdl_forum_discussion_url(@mdl_forum_discussion)
    end

    assert_redirected_to mdl_forum_discussions_url
  end
end
