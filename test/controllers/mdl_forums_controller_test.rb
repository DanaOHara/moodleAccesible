require 'test_helper'

class MdlForumsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mdl_forum = mdl_forums(:one)
  end

  test "should get index" do
    get mdl_forums_url
    assert_response :success
  end

  test "should get new" do
    get new_mdl_forum_url
    assert_response :success
  end

  test "should create mdl_forum" do
    assert_difference('MdlForum.count') do
      post mdl_forums_url, params: { mdl_forum: { assessed: @mdl_forum.assessed, assesstimefinish: @mdl_forum.assesstimefinish, assesstimestart: @mdl_forum.assesstimestart, blockafter: @mdl_forum.blockafter, blockperiod: @mdl_forum.blockperiod, completiondiscussions: @mdl_forum.completiondiscussions, completionposts: @mdl_forum.completionposts, completionreplies: @mdl_forum.completionreplies, course: @mdl_forum.course, displaywordcount: @mdl_forum.displaywordcount, forcesubscribe: @mdl_forum.forcesubscribe, intro: @mdl_forum.intro, introformat: @mdl_forum.introformat, maxattachments: @mdl_forum.maxattachments, maxbytes: @mdl_forum.maxbytes, name: @mdl_forum.name, rssarticles: @mdl_forum.rssarticles, rsstype: @mdl_forum.rsstype, scale: @mdl_forum.scale, timemodified: @mdl_forum.timemodified, trackingtype: @mdl_forum.trackingtype, warnafter: @mdl_forum.warnafter } }
    end

    assert_redirected_to mdl_forum_url(MdlForum.last)
  end

  test "should show mdl_forum" do
    get mdl_forum_url(@mdl_forum)
    assert_response :success
  end

  test "should get edit" do
    get edit_mdl_forum_url(@mdl_forum)
    assert_response :success
  end

  test "should update mdl_forum" do
    patch mdl_forum_url(@mdl_forum), params: { mdl_forum: { assessed: @mdl_forum.assessed, assesstimefinish: @mdl_forum.assesstimefinish, assesstimestart: @mdl_forum.assesstimestart, blockafter: @mdl_forum.blockafter, blockperiod: @mdl_forum.blockperiod, completiondiscussions: @mdl_forum.completiondiscussions, completionposts: @mdl_forum.completionposts, completionreplies: @mdl_forum.completionreplies, course: @mdl_forum.course, displaywordcount: @mdl_forum.displaywordcount, forcesubscribe: @mdl_forum.forcesubscribe, intro: @mdl_forum.intro, introformat: @mdl_forum.introformat, maxattachments: @mdl_forum.maxattachments, maxbytes: @mdl_forum.maxbytes, name: @mdl_forum.name, rssarticles: @mdl_forum.rssarticles, rsstype: @mdl_forum.rsstype, scale: @mdl_forum.scale, timemodified: @mdl_forum.timemodified, trackingtype: @mdl_forum.trackingtype, warnafter: @mdl_forum.warnafter } }
    assert_redirected_to mdl_forum_url(@mdl_forum)
  end

  test "should destroy mdl_forum" do
    assert_difference('MdlForum.count', -1) do
      delete mdl_forum_url(@mdl_forum)
    end

    assert_redirected_to mdl_forums_url
  end
end
