json.extract! mdl_forum_post, :id, :discussion, :parent, :userid, :created, :modified, :mailed, :subject, :message, :messageformat, :messagetrust, :attachment, :totalscore, :mailnow, :created_at, :updated_at
json.url mdl_forum_post_url(mdl_forum_post, format: :json)
