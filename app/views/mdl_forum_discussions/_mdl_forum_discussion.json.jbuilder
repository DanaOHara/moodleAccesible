json.extract! mdl_forum_discussion, :id, :course, :forum, :name, :firstpost, :userid, :groupid, :assessed, :timemodified, :usermodified, :timestart, :timeend, :created_at, :updated_at
json.url mdl_forum_discussion_url(mdl_forum_discussion, format: :json)
