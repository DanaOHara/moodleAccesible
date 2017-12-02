require 'test_helper'

class MdlForumPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mdl_forum_post = mdl_forum_posts(:one)
  end

  test "should get index" do
    get mdl_forum_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_mdl_forum_post_url
    assert_response :success
  end

  test "should create mdl_forum_post" do
    assert_difference('MdlForumPost.count') do
      post mdl_forum_posts_url, params: { mdl_forum_post: { attachment: @mdl_forum_post.attachment, created: @mdl_forum_post.created, discussion: @mdl_forum_post.discussion, mailed: @mdl_forum_post.mailed, mailnow: @mdl_forum_post.mailnow, message: @mdl_forum_post.message, messageformat: @mdl_forum_post.messageformat, messagetrust: @mdl_forum_post.messagetrust, modified: @mdl_forum_post.modified, parent: @mdl_forum_post.parent, subject: @mdl_forum_post.subject, totalscore: @mdl_forum_post.totalscore, userid: @mdl_forum_post.userid } }
    end

    assert_redirected_to mdl_forum_post_url(MdlForumPost.last)
  end

  test "should show mdl_forum_post" do
    get mdl_forum_post_url(@mdl_forum_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_mdl_forum_post_url(@mdl_forum_post)
    assert_response :success
  end

  test "should update mdl_forum_post" do
    patch mdl_forum_post_url(@mdl_forum_post), params: { mdl_forum_post: { attachment: @mdl_forum_post.attachment, created: @mdl_forum_post.created, discussion: @mdl_forum_post.discussion, mailed: @mdl_forum_post.mailed, mailnow: @mdl_forum_post.mailnow, message: @mdl_forum_post.message, messageformat: @mdl_forum_post.messageformat, messagetrust: @mdl_forum_post.messagetrust, modified: @mdl_forum_post.modified, parent: @mdl_forum_post.parent, subject: @mdl_forum_post.subject, totalscore: @mdl_forum_post.totalscore, userid: @mdl_forum_post.userid } }
    assert_redirected_to mdl_forum_post_url(@mdl_forum_post)
  end

  test "should destroy mdl_forum_post" do
    assert_difference('MdlForumPost.count', -1) do
      delete mdl_forum_post_url(@mdl_forum_post)
    end

    assert_redirected_to mdl_forum_posts_url
  end
end
