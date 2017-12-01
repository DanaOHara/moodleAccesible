require 'test_helper'

class MdlUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mdl_user = mdl_users(:one)
  end

  test "should get index" do
    get mdl_users_url
    assert_response :success
  end

  test "should get new" do
    get new_mdl_user_url
    assert_response :success
  end

  test "should create mdl_user" do
    assert_difference('MdlUser.count') do
      post mdl_users_url, params: { mdl_user: { address: @mdl_user.address, aim: @mdl_user.aim, alternatename: @mdl_user.alternatename, auth: @mdl_user.auth, autosubscribe: @mdl_user.autosubscribe, calendartype: @mdl_user.calendartype, city: @mdl_user.city, confirmed: @mdl_user.confirmed, country: @mdl_user.country, currentlogin: @mdl_user.currentlogin, deleted: @mdl_user.deleted, department: @mdl_user.department, description: @mdl_user.description, descriptionformat: @mdl_user.descriptionformat, email: @mdl_user.email, emailstop: @mdl_user.emailstop, firstaccess: @mdl_user.firstaccess, firstname: @mdl_user.firstname, firstnamephonetic: @mdl_user.firstnamephonetic, icq: @mdl_user.icq, idnumber: @mdl_user.idnumber, imagealt: @mdl_user.imagealt, institution: @mdl_user.institution, lang: @mdl_user.lang, lastaccess: @mdl_user.lastaccess, lastip: @mdl_user.lastip, lastlogin: @mdl_user.lastlogin, lastname: @mdl_user.lastname, lastnamephonetic: @mdl_user.lastnamephonetic, maildigest: @mdl_user.maildigest, maildisplay: @mdl_user.maildisplay, mailformat: @mdl_user.mailformat, middlename: @mdl_user.middlename, mnethostid: @mdl_user.mnethostid, msn: @mdl_user.msn, password: @mdl_user.password, phone1: @mdl_user.phone1, phone2: @mdl_user.phone2, picture: @mdl_user.picture, policyagreed: @mdl_user.policyagreed, secret: @mdl_user.secret, skype: @mdl_user.skype, suspended: @mdl_user.suspended, theme: @mdl_user.theme, timecreated: @mdl_user.timecreated, timemodified: @mdl_user.timemodified, timezone: @mdl_user.timezone, trackforums: @mdl_user.trackforums, trustbitmask: @mdl_user.trustbitmask, url: @mdl_user.url, username: @mdl_user.username, yahoo: @mdl_user.yahoo } }
    end

    assert_redirected_to mdl_user_url(MdlUser.last)
  end

  test "should show mdl_user" do
    get mdl_user_url(@mdl_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_mdl_user_url(@mdl_user)
    assert_response :success
  end

  test "should update mdl_user" do
    patch mdl_user_url(@mdl_user), params: { mdl_user: { address: @mdl_user.address, aim: @mdl_user.aim, alternatename: @mdl_user.alternatename, auth: @mdl_user.auth, autosubscribe: @mdl_user.autosubscribe, calendartype: @mdl_user.calendartype, city: @mdl_user.city, confirmed: @mdl_user.confirmed, country: @mdl_user.country, currentlogin: @mdl_user.currentlogin, deleted: @mdl_user.deleted, department: @mdl_user.department, description: @mdl_user.description, descriptionformat: @mdl_user.descriptionformat, email: @mdl_user.email, emailstop: @mdl_user.emailstop, firstaccess: @mdl_user.firstaccess, firstname: @mdl_user.firstname, firstnamephonetic: @mdl_user.firstnamephonetic, icq: @mdl_user.icq, idnumber: @mdl_user.idnumber, imagealt: @mdl_user.imagealt, institution: @mdl_user.institution, lang: @mdl_user.lang, lastaccess: @mdl_user.lastaccess, lastip: @mdl_user.lastip, lastlogin: @mdl_user.lastlogin, lastname: @mdl_user.lastname, lastnamephonetic: @mdl_user.lastnamephonetic, maildigest: @mdl_user.maildigest, maildisplay: @mdl_user.maildisplay, mailformat: @mdl_user.mailformat, middlename: @mdl_user.middlename, mnethostid: @mdl_user.mnethostid, msn: @mdl_user.msn, password: @mdl_user.password, phone1: @mdl_user.phone1, phone2: @mdl_user.phone2, picture: @mdl_user.picture, policyagreed: @mdl_user.policyagreed, secret: @mdl_user.secret, skype: @mdl_user.skype, suspended: @mdl_user.suspended, theme: @mdl_user.theme, timecreated: @mdl_user.timecreated, timemodified: @mdl_user.timemodified, timezone: @mdl_user.timezone, trackforums: @mdl_user.trackforums, trustbitmask: @mdl_user.trustbitmask, url: @mdl_user.url, username: @mdl_user.username, yahoo: @mdl_user.yahoo } }
    assert_redirected_to mdl_user_url(@mdl_user)
  end

  test "should destroy mdl_user" do
    assert_difference('MdlUser.count', -1) do
      delete mdl_user_url(@mdl_user)
    end

    assert_redirected_to mdl_users_url
  end
end
