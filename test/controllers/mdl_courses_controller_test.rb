require 'test_helper'

class MdlCoursesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mdl_course = mdl_courses(:one)
  end

  test "should get index" do
    get mdl_courses_url
    assert_response :success
  end

  test "should get new" do
    get new_mdl_course_url
    assert_response :success
  end

  test "should create mdl_course" do
    assert_difference('MdlCourse.count') do
      post mdl_courses_url, params: { mdl_course: { cacherev: @mdl_course.cacherev, calendartype: @mdl_course.calendartype, category: @mdl_course.category, completionnotify: @mdl_course.completionnotify, defaultgroupingid: @mdl_course.defaultgroupingid, enablecompletion: @mdl_course.enablecompletion, format: @mdl_course.format, fullname: @mdl_course.fullname, groupmode: @mdl_course.groupmode, groupmodeforce: @mdl_course.groupmodeforce, idnumber: @mdl_course.idnumber, lang: @mdl_course.lang, legacyfiles: @mdl_course.legacyfiles, marker: @mdl_course.marker, maxbytes: @mdl_course.maxbytes, newsitems: @mdl_course.newsitems, requested: @mdl_course.requested, shortname: @mdl_course.shortname, showgrades: @mdl_course.showgrades, showreports: @mdl_course.showreports, sortorder: @mdl_course.sortorder, startdate: @mdl_course.startdate, summary: @mdl_course.summary, summaryformat: @mdl_course.summaryformat, theme: @mdl_course.theme, timecreated: @mdl_course.timecreated, timemodified: @mdl_course.timemodified, visible: @mdl_course.visible, visibleold: @mdl_course.visibleold } }
    end

    assert_redirected_to mdl_course_url(MdlCourse.last)
  end

  test "should show mdl_course" do
    get mdl_course_url(@mdl_course)
    assert_response :success
  end

  test "should get edit" do
    get edit_mdl_course_url(@mdl_course)
    assert_response :success
  end

  test "should update mdl_course" do
    patch mdl_course_url(@mdl_course), params: { mdl_course: { cacherev: @mdl_course.cacherev, calendartype: @mdl_course.calendartype, category: @mdl_course.category, completionnotify: @mdl_course.completionnotify, defaultgroupingid: @mdl_course.defaultgroupingid, enablecompletion: @mdl_course.enablecompletion, format: @mdl_course.format, fullname: @mdl_course.fullname, groupmode: @mdl_course.groupmode, groupmodeforce: @mdl_course.groupmodeforce, idnumber: @mdl_course.idnumber, lang: @mdl_course.lang, legacyfiles: @mdl_course.legacyfiles, marker: @mdl_course.marker, maxbytes: @mdl_course.maxbytes, newsitems: @mdl_course.newsitems, requested: @mdl_course.requested, shortname: @mdl_course.shortname, showgrades: @mdl_course.showgrades, showreports: @mdl_course.showreports, sortorder: @mdl_course.sortorder, startdate: @mdl_course.startdate, summary: @mdl_course.summary, summaryformat: @mdl_course.summaryformat, theme: @mdl_course.theme, timecreated: @mdl_course.timecreated, timemodified: @mdl_course.timemodified, visible: @mdl_course.visible, visibleold: @mdl_course.visibleold } }
    assert_redirected_to mdl_course_url(@mdl_course)
  end

  test "should destroy mdl_course" do
    assert_difference('MdlCourse.count', -1) do
      delete mdl_course_url(@mdl_course)
    end

    assert_redirected_to mdl_courses_url
  end
end
