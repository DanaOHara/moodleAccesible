json.extract! mdl_user, :id, :auth, :confirmed, :policyagreed, :deleted, :suspended, :mnethostid, :username, :password, :idnumber, :firstname, :lastname, :email, :emailstop, :icq, :skype, :yahoo, :aim, :msn, :phone1, :phone2, :institution, :department, :address, :city, :country, :lang, :calendartype, :theme, :timezone, :firstaccess, :lastaccess, :lastlogin, :currentlogin, :lastip, :secret, :picture, :url, :description, :descriptionformat, :mailformat, :maildigest, :maildisplay, :autosubscribe, :trackforums, :timecreated, :timemodified, :trustbitmask, :imagealt, :lastnamephonetic, :firstnamephonetic, :middlename, :alternatename, :created_at, :updated_at
json.url mdl_user_url(mdl_user, format: :json)
