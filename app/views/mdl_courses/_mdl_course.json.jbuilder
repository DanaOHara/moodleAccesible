json.extract! mdl_course, :id, :category, :sortorder, :fullname, :shortname, :idnumber, :summary, :summaryformat, :format, :showgrades, :newsitems, :startdate, :marker, :maxbytes, :legacyfiles, :showreports, :visible, :visibleold, :groupmode, :groupmodeforce, :defaultgroupingid, :lang, :calendartype, :theme, :timecreated, :timemodified, :requested, :enablecompletion, :completionnotify, :cacherev, :created_at, :updated_at
json.url mdl_course_url(mdl_course, format: :json)