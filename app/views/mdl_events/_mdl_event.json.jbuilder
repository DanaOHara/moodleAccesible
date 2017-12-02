json.extract! mdl_event, :id, :name, :description, :format, :courseid, :groupid, :userid, :repeatid, :modulename, :instance, :eventtype, :timestart, :timeduration, :visible, :uuid, :sequence, :timemodified, :subscriptionid, :created_at, :updated_at
json.url mdl_event_url(mdl_event, format: :json)
