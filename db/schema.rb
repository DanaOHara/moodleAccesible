# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "mdl_assign", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This table saves information about an instance of mod_assign" do |t|
    t.bigint  "course",                                         default: 0,      null: false
    t.string  "name",                                           default: "",     null: false
    t.text    "intro",                       limit: 4294967295,                  null: false
    t.integer "introformat",                 limit: 2,          default: 0,      null: false
    t.integer "alwaysshowdescription",       limit: 1,          default: 0,      null: false
    t.integer "nosubmissions",               limit: 1,          default: 0,      null: false
    t.integer "submissiondrafts",            limit: 1,          default: 0,      null: false
    t.integer "sendnotifications",           limit: 1,          default: 0,      null: false
    t.integer "sendlatenotifications",       limit: 1,          default: 0,      null: false
    t.bigint  "duedate",                                        default: 0,      null: false
    t.bigint  "allowsubmissionsfromdate",                       default: 0,      null: false
    t.bigint  "grade",                                          default: 0,      null: false
    t.bigint  "timemodified",                                   default: 0,      null: false
    t.integer "requiresubmissionstatement",  limit: 1,          default: 0,      null: false
    t.integer "completionsubmit",            limit: 1,          default: 0,      null: false
    t.bigint  "cutoffdate",                                     default: 0,      null: false
    t.integer "teamsubmission",              limit: 1,          default: 0,      null: false
    t.integer "requireallteammemberssubmit", limit: 1,          default: 0,      null: false
    t.bigint  "teamsubmissiongroupingid",                       default: 0,      null: false
    t.integer "blindmarking",                limit: 1,          default: 0,      null: false
    t.integer "revealidentities",            limit: 1,          default: 0,      null: false
    t.string  "attemptreopenmethod",         limit: 10,         default: "none", null: false
    t.integer "maxattempts",                 limit: 3,          default: -1,     null: false
    t.integer "markingworkflow",             limit: 1,          default: 0,      null: false
    t.integer "markingallocation",           limit: 1,          default: 0,      null: false
    t.integer "sendstudentnotifications",    limit: 1,          default: 1,      null: false
    t.index ["course"], name: "mdl_assi_cou_ix", using: :btree
    t.index ["teamsubmissiongroupingid"], name: "mdl_assi_tea_ix", using: :btree
  end

  create_table "mdl_assign_grades", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Grading information about a single assignment submission." do |t|
    t.bigint  "assignment",                             default: 0,     null: false
    t.bigint  "userid",                                 default: 0,     null: false
    t.bigint  "timecreated",                            default: 0,     null: false
    t.bigint  "timemodified",                           default: 0,     null: false
    t.bigint  "grader",                                 default: 0,     null: false
    t.decimal "grade",         precision: 10, scale: 5, default: "0.0"
    t.bigint  "attemptnumber",                          default: 0,     null: false
    t.index ["assignment", "userid", "attemptnumber"], name: "mdl_assigrad_assuseatt_uix", unique: true, using: :btree
    t.index ["assignment"], name: "mdl_assigrad_ass_ix", using: :btree
    t.index ["attemptnumber"], name: "mdl_assigrad_att_ix", using: :btree
    t.index ["userid"], name: "mdl_assigrad_use_ix", using: :btree
  end

  create_table "mdl_assign_plugin_config", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Config data for an instance of a plugin in an assignment." do |t|
    t.bigint "assignment",                    default: 0,  null: false
    t.string "plugin",     limit: 28,         default: "", null: false
    t.string "subtype",    limit: 28,         default: "", null: false
    t.string "name",       limit: 28,         default: "", null: false
    t.text   "value",      limit: 4294967295
    t.index ["assignment"], name: "mdl_assiplugconf_ass_ix", using: :btree
    t.index ["name"], name: "mdl_assiplugconf_nam_ix", using: :btree
    t.index ["plugin"], name: "mdl_assiplugconf_plu_ix", using: :btree
    t.index ["subtype"], name: "mdl_assiplugconf_sub_ix", using: :btree
  end

  create_table "mdl_assign_submission", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This table keeps information about student interactions with" do |t|
    t.bigint "assignment",               default: 0, null: false
    t.bigint "userid",                   default: 0, null: false
    t.bigint "timecreated",              default: 0, null: false
    t.bigint "timemodified",             default: 0, null: false
    t.string "status",        limit: 10
    t.bigint "groupid",                  default: 0, null: false
    t.bigint "attemptnumber",            default: 0, null: false
    t.index ["assignment", "userid", "groupid", "attemptnumber"], name: "mdl_assisubm_assusegroatt_uix", unique: true, using: :btree
    t.index ["assignment"], name: "mdl_assisubm_ass_ix", using: :btree
    t.index ["attemptnumber"], name: "mdl_assisubm_att_ix", using: :btree
    t.index ["userid"], name: "mdl_assisubm_use_ix", using: :btree
  end

  create_table "mdl_assign_user_flags", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "List of flags that can be set for a single user in a single " do |t|
    t.bigint  "userid",                      default: 0, null: false
    t.bigint  "assignment",                  default: 0, null: false
    t.bigint  "locked",                      default: 0, null: false
    t.integer "mailed",           limit: 2,  default: 0, null: false
    t.bigint  "extensionduedate",            default: 0, null: false
    t.string  "workflowstate",    limit: 20
    t.bigint  "allocatedmarker",             default: 0, null: false
    t.index ["assignment"], name: "mdl_assiuserflag_ass_ix", using: :btree
    t.index ["mailed"], name: "mdl_assiuserflag_mai_ix", using: :btree
    t.index ["userid"], name: "mdl_assiuserflag_use_ix", using: :btree
  end

  create_table "mdl_assign_user_mapping", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Map an assignment specific id number to a user" do |t|
    t.bigint "assignment", default: 0, null: false
    t.bigint "userid",     default: 0, null: false
    t.index ["assignment"], name: "mdl_assiusermapp_ass_ix", using: :btree
    t.index ["userid"], name: "mdl_assiusermapp_use_ix", using: :btree
  end

  create_table "mdl_assignfeedback_comments", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Text feedback for submitted assignments" do |t|
    t.bigint  "assignment",                       default: 0, null: false
    t.bigint  "grade",                            default: 0, null: false
    t.text    "commenttext",   limit: 4294967295
    t.integer "commentformat", limit: 2,          default: 0, null: false
    t.index ["assignment"], name: "mdl_assicomm_ass_ix", using: :btree
    t.index ["grade"], name: "mdl_assicomm_gra_ix", using: :btree
  end

  create_table "mdl_assignfeedback_editpdf_annot", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "stores annotations added to pdfs submitted by students" do |t|
    t.bigint  "gradeid",                    default: 0,       null: false
    t.bigint  "pageno",                     default: 0,       null: false
    t.bigint  "x",                          default: 0
    t.bigint  "y",                          default: 0
    t.bigint  "endx",                       default: 0
    t.bigint  "endy",                       default: 0
    t.text    "path",    limit: 4294967295
    t.string  "type",    limit: 10,         default: "line"
    t.string  "colour",  limit: 10,         default: "black"
    t.integer "draft",   limit: 1,          default: 1,       null: false
    t.index ["gradeid", "pageno"], name: "mdl_assieditanno_grapag_ix", using: :btree
    t.index ["gradeid"], name: "mdl_assieditanno_gra_ix", using: :btree
  end

  create_table "mdl_assignfeedback_editpdf_cmnt", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores comments added to pdfs" do |t|
    t.bigint  "gradeid",                    default: 0,       null: false
    t.bigint  "x",                          default: 0
    t.bigint  "y",                          default: 0
    t.bigint  "width",                      default: 120
    t.text    "rawtext", limit: 4294967295
    t.bigint  "pageno",                     default: 0,       null: false
    t.string  "colour",  limit: 10,         default: "black"
    t.integer "draft",   limit: 1,          default: 1,       null: false
    t.index ["gradeid", "pageno"], name: "mdl_assieditcmnt_grapag_ix", using: :btree
    t.index ["gradeid"], name: "mdl_assieditcmnt_gra_ix", using: :btree
  end

  create_table "mdl_assignfeedback_editpdf_quick", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores teacher specified quicklist comments" do |t|
    t.bigint "userid",                     default: 0,        null: false
    t.text   "rawtext", limit: 4294967295,                    null: false
    t.bigint "width",                      default: 120,      null: false
    t.string "colour",  limit: 10,         default: "yellow"
    t.index ["userid"], name: "mdl_assieditquic_use_ix", using: :btree
  end

  create_table "mdl_assignfeedback_file", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores info about the number of files submitted by a student" do |t|
    t.bigint "assignment", default: 0, null: false
    t.bigint "grade",      default: 0, null: false
    t.bigint "numfiles",   default: 0, null: false
    t.index ["assignment"], name: "mdl_assifile_ass2_ix", using: :btree
    t.index ["grade"], name: "mdl_assifile_gra_ix", using: :btree
  end

  create_table "mdl_assignment", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Defines assignments" do |t|
    t.bigint  "course",                            default: 0,      null: false
    t.string  "name",                              default: "",     null: false
    t.text    "intro",          limit: 4294967295,                  null: false
    t.integer "introformat",    limit: 2,          default: 0,      null: false
    t.string  "assignmenttype", limit: 50,         default: "",     null: false
    t.integer "resubmit",       limit: 1,          default: 0,      null: false
    t.integer "preventlate",    limit: 1,          default: 0,      null: false
    t.integer "emailteachers",  limit: 1,          default: 0,      null: false
    t.bigint  "var1",                              default: 0
    t.bigint  "var2",                              default: 0
    t.bigint  "var3",                              default: 0
    t.bigint  "var4",                              default: 0
    t.bigint  "var5",                              default: 0
    t.bigint  "maxbytes",                          default: 100000, null: false
    t.bigint  "timedue",                           default: 0,      null: false
    t.bigint  "timeavailable",                     default: 0,      null: false
    t.bigint  "grade",                             default: 0,      null: false
    t.bigint  "timemodified",                      default: 0,      null: false
    t.index ["course"], name: "mdl_assi_cou2_ix", using: :btree
  end

  create_table "mdl_assignment_submissions", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Info about submitted assignments" do |t|
    t.bigint  "assignment",                           default: 0,     null: false
    t.bigint  "userid",                               default: 0,     null: false
    t.bigint  "timecreated",                          default: 0,     null: false
    t.bigint  "timemodified",                         default: 0,     null: false
    t.bigint  "numfiles",                             default: 0,     null: false
    t.text    "data1",             limit: 4294967295
    t.text    "data2",             limit: 4294967295
    t.bigint  "grade",                                default: 0,     null: false
    t.text    "submissioncomment", limit: 4294967295,                 null: false
    t.integer "format",            limit: 2,          default: 0,     null: false
    t.bigint  "teacher",                              default: 0,     null: false
    t.bigint  "timemarked",                           default: 0,     null: false
    t.boolean "mailed",                               default: false, null: false
    t.index ["assignment"], name: "mdl_assisubm_ass2_ix", using: :btree
    t.index ["mailed"], name: "mdl_assisubm_mai_ix", using: :btree
    t.index ["timemarked"], name: "mdl_assisubm_tim_ix", using: :btree
    t.index ["userid"], name: "mdl_assisubm_use2_ix", using: :btree
  end

  create_table "mdl_assignment_upgrade", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Info about upgraded assignments" do |t|
    t.bigint "oldcmid",     default: 0, null: false
    t.bigint "oldinstance", default: 0, null: false
    t.bigint "newcmid",     default: 0, null: false
    t.bigint "newinstance", default: 0, null: false
    t.bigint "timecreated", default: 0, null: false
    t.index ["oldcmid"], name: "mdl_assiupgr_old_ix", using: :btree
    t.index ["oldinstance"], name: "mdl_assiupgr_old2_ix", using: :btree
  end

  create_table "mdl_assignsubmission_file", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Info about file submissions for assignments" do |t|
    t.bigint "assignment", default: 0, null: false
    t.bigint "submission", default: 0, null: false
    t.bigint "numfiles",   default: 0, null: false
    t.index ["assignment"], name: "mdl_assifile_ass_ix", using: :btree
    t.index ["submission"], name: "mdl_assifile_sub_ix", using: :btree
  end

  create_table "mdl_assignsubmission_onlinetext", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Info about onlinetext submission" do |t|
    t.bigint  "assignment",                      default: 0, null: false
    t.bigint  "submission",                      default: 0, null: false
    t.text    "onlinetext",   limit: 4294967295
    t.integer "onlineformat", limit: 2,          default: 0, null: false
    t.index ["assignment"], name: "mdl_assionli_ass_ix", using: :btree
    t.index ["submission"], name: "mdl_assionli_sub_ix", using: :btree
  end

  create_table "mdl_backup_controllers", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "To store the backup_controllers as they are used" do |t|
    t.string  "backupid",      limit: 32,         default: "",       null: false
    t.string  "operation",     limit: 20,         default: "backup", null: false
    t.string  "type",          limit: 10,         default: "",       null: false
    t.bigint  "itemid",                                              null: false
    t.string  "format",        limit: 20,         default: "",       null: false
    t.integer "interactive",   limit: 2,                             null: false
    t.integer "purpose",       limit: 2,                             null: false
    t.bigint  "userid",                                              null: false
    t.integer "status",        limit: 2,                             null: false
    t.integer "execution",     limit: 2,                             null: false
    t.bigint  "executiontime",                                       null: false
    t.string  "checksum",      limit: 32,         default: "",       null: false
    t.bigint  "timecreated",                                         null: false
    t.bigint  "timemodified",                                        null: false
    t.text    "controller",    limit: 4294967295,                    null: false
    t.index ["backupid"], name: "mdl_backcont_bac_uix", unique: true, using: :btree
    t.index ["type", "itemid"], name: "mdl_backcont_typite_ix", using: :btree
    t.index ["userid"], name: "mdl_backcont_use_ix", using: :btree
  end

  create_table "mdl_backup_courses", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "To store every course backup status" do |t|
    t.bigint "courseid",                default: 0,   null: false
    t.bigint "laststarttime",           default: 0,   null: false
    t.bigint "lastendtime",             default: 0,   null: false
    t.string "laststatus",    limit: 1, default: "5", null: false
    t.bigint "nextstarttime",           default: 0,   null: false
    t.index ["courseid"], name: "mdl_backcour_cou_uix", unique: true, using: :btree
  end

  create_table "mdl_backup_logs", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "To store all the logs from backup and restore operations (by" do |t|
    t.string  "backupid",    limit: 32,         default: "", null: false
    t.integer "loglevel",    limit: 2,                       null: false
    t.text    "message",     limit: 4294967295,              null: false
    t.bigint  "timecreated",                                 null: false
    t.index ["backupid", "id"], name: "mdl_backlogs_bacid_uix", unique: true, using: :btree
    t.index ["backupid"], name: "mdl_backlogs_bac_ix", using: :btree
  end

  create_table "mdl_badge", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Defines badge" do |t|
    t.string  "name",                              default: "",    null: false
    t.text    "description",    limit: 4294967295
    t.bigint  "timecreated",                       default: 0,     null: false
    t.bigint  "timemodified",                      default: 0,     null: false
    t.bigint  "usercreated",                                       null: false
    t.bigint  "usermodified",                                      null: false
    t.string  "issuername",                        default: "",    null: false
    t.string  "issuerurl",                         default: "",    null: false
    t.string  "issuercontact"
    t.bigint  "expiredate"
    t.bigint  "expireperiod"
    t.boolean "type",                              default: true,  null: false
    t.bigint  "courseid"
    t.text    "message",        limit: 4294967295,                 null: false
    t.text    "messagesubject", limit: 4294967295,                 null: false
    t.boolean "attachment",                        default: true,  null: false
    t.boolean "notification",                      default: true,  null: false
    t.boolean "status",                            default: false, null: false
    t.bigint  "nextcron"
    t.index ["courseid"], name: "mdl_badg_cou_ix", using: :btree
    t.index ["type"], name: "mdl_badg_typ_ix", using: :btree
    t.index ["usercreated"], name: "mdl_badg_use2_ix", using: :btree
    t.index ["usermodified"], name: "mdl_badg_use_ix", using: :btree
  end

  create_table "mdl_badge_backpack", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Defines settings for connecting external backpack" do |t|
    t.bigint  "userid",                  default: 0,     null: false
    t.string  "email",       limit: 100, default: "",    null: false
    t.string  "backpackurl",             default: "",    null: false
    t.bigint  "backpackuid",                             null: false
    t.boolean "autosync",                default: false, null: false
    t.string  "password",    limit: 50
    t.index ["userid"], name: "mdl_badgback_use_ix", using: :btree
  end

  create_table "mdl_badge_criteria", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Defines criteria for issuing badges" do |t|
    t.bigint  "badgeid",      default: 0,    null: false
    t.bigint  "criteriatype"
    t.boolean "method",       default: true, null: false
    t.index ["badgeid", "criteriatype"], name: "mdl_badgcrit_badcri_uix", unique: true, using: :btree
    t.index ["badgeid"], name: "mdl_badgcrit_bad_ix", using: :btree
    t.index ["criteriatype"], name: "mdl_badgcrit_cri_ix", using: :btree
  end

  create_table "mdl_badge_criteria_met", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Defines criteria that were met for an issued badge" do |t|
    t.bigint "issuedid"
    t.bigint "critid",   null: false
    t.bigint "userid",   null: false
    t.bigint "datemet",  null: false
    t.index ["critid"], name: "mdl_badgcritmet_cri_ix", using: :btree
    t.index ["issuedid"], name: "mdl_badgcritmet_iss_ix", using: :btree
    t.index ["userid"], name: "mdl_badgcritmet_use_ix", using: :btree
  end

  create_table "mdl_badge_criteria_param", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Defines parameters for badges criteria" do |t|
    t.bigint "critid",              null: false
    t.string "name",   default: "", null: false
    t.string "value"
    t.index ["critid"], name: "mdl_badgcritpara_cri_ix", using: :btree
  end

  create_table "mdl_badge_external", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Setting for external badges display" do |t|
    t.bigint "backpackid",   null: false
    t.bigint "collectionid", null: false
    t.index ["backpackid"], name: "mdl_badgexte_bac_ix", using: :btree
  end

  create_table "mdl_badge_issued", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Defines issued badges" do |t|
    t.bigint  "badgeid",                           default: 0,     null: false
    t.bigint  "userid",                            default: 0,     null: false
    t.text    "uniquehash",     limit: 4294967295,                 null: false
    t.bigint  "dateissued",                        default: 0,     null: false
    t.bigint  "dateexpire"
    t.boolean "visible",                           default: false, null: false
    t.bigint  "issuernotified"
    t.index ["badgeid", "userid"], name: "mdl_badgissu_baduse_uix", unique: true, using: :btree
    t.index ["badgeid"], name: "mdl_badgissu_bad_ix", using: :btree
    t.index ["userid"], name: "mdl_badgissu_use_ix", using: :btree
  end

  create_table "mdl_badge_manual_award", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Track manual award criteria for badges" do |t|
    t.bigint "badgeid",     null: false
    t.bigint "recipientid", null: false
    t.bigint "issuerid",    null: false
    t.bigint "issuerrole",  null: false
    t.bigint "datemet",     null: false
    t.index ["badgeid"], name: "mdl_badgmanuawar_bad_ix", using: :btree
    t.index ["issuerid"], name: "mdl_badgmanuawar_iss_ix", using: :btree
    t.index ["issuerrole"], name: "mdl_badgmanuawar_iss2_ix", using: :btree
    t.index ["recipientid"], name: "mdl_badgmanuawar_rec_ix", using: :btree
  end

  create_table "mdl_block", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "contains all installed blocks" do |t|
    t.string  "name",     limit: 40, default: "",   null: false
    t.bigint  "cron",                default: 0,    null: false
    t.bigint  "lastcron",            default: 0,    null: false
    t.boolean "visible",             default: true, null: false
    t.index ["name"], name: "mdl_bloc_nam_uix", unique: true, using: :btree
  end

  create_table "mdl_block_community", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Community block" do |t|
    t.bigint "userid",                                            null: false
    t.string "coursename",                           default: "", null: false
    t.text   "coursedescription", limit: 4294967295
    t.string "courseurl",                            default: "", null: false
    t.string "imageurl",                             default: "", null: false
  end

  create_table "mdl_block_instances", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This table stores block instances. The type of block this is" do |t|
    t.string  "blockname",         limit: 40,         default: "", null: false
    t.bigint  "parentcontextid",                                   null: false
    t.integer "showinsubcontexts", limit: 2,                       null: false
    t.string  "pagetypepattern",   limit: 64,         default: "", null: false
    t.string  "subpagepattern",    limit: 16
    t.string  "defaultregion",     limit: 16,         default: "", null: false
    t.bigint  "defaultweight",                                     null: false
    t.text    "configdata",        limit: 4294967295
    t.index ["parentcontextid", "showinsubcontexts", "pagetypepattern", "subpagepattern"], name: "mdl_blocinst_parshopagsub_ix", using: :btree
    t.index ["parentcontextid"], name: "mdl_blocinst_par_ix", using: :btree
  end

  create_table "mdl_block_positions", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores the position of a sticky block_instance on a another " do |t|
    t.bigint  "blockinstanceid",                         null: false
    t.bigint  "contextid",                               null: false
    t.string  "pagetype",        limit: 64, default: "", null: false
    t.string  "subpage",         limit: 16, default: "", null: false
    t.integer "visible",         limit: 2,               null: false
    t.string  "region",          limit: 16, default: "", null: false
    t.bigint  "weight",                                  null: false
    t.index ["blockinstanceid", "contextid", "pagetype", "subpage"], name: "mdl_blocposi_bloconpagsub_uix", unique: true, using: :btree
    t.index ["blockinstanceid"], name: "mdl_blocposi_blo_ix", using: :btree
    t.index ["contextid"], name: "mdl_blocposi_con_ix", using: :btree
  end

  create_table "mdl_block_recent_activity", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Recent activity block" do |t|
    t.bigint  "courseid",               null: false
    t.bigint  "cmid",                   null: false
    t.bigint  "timecreated",            null: false
    t.bigint  "userid",                 null: false
    t.boolean "action",                 null: false
    t.string  "modname",     limit: 20
    t.index ["courseid", "timecreated"], name: "mdl_blocreceacti_coutim_ix", using: :btree
  end

  create_table "mdl_block_rss_client", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Remote news feed information. Contains the news feed id, the" do |t|
    t.bigint  "userid",                            default: 0,  null: false
    t.text    "title",          limit: 4294967295,              null: false
    t.string  "preferredtitle", limit: 64,         default: "", null: false
    t.text    "description",    limit: 4294967295,              null: false
    t.integer "shared",         limit: 1,          default: 0,  null: false
    t.string  "url",                               default: "", null: false
  end

  create_table "mdl_blog_association", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Associations of blog entries with courses and module instanc" do |t|
    t.bigint "contextid", null: false
    t.bigint "blogid",    null: false
    t.index ["blogid"], name: "mdl_blogasso_blo_ix", using: :btree
    t.index ["contextid"], name: "mdl_blogasso_con_ix", using: :btree
  end

  create_table "mdl_blog_external", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "External blog links used for RSS copying of blog entries to " do |t|
    t.bigint  "userid",                                            null: false
    t.string  "name",                              default: "",    null: false
    t.text    "description",    limit: 4294967295
    t.text    "url",            limit: 4294967295,                 null: false
    t.string  "filtertags"
    t.boolean "failedlastsync",                    default: false, null: false
    t.bigint  "timemodified"
    t.bigint  "timefetched",                       default: 0,     null: false
    t.index ["userid"], name: "mdl_blogexte_use_ix", using: :btree
  end

  create_table "mdl_book", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Defines book" do |t|
    t.bigint  "course",                          default: 0,  null: false
    t.string  "name",                            default: "", null: false
    t.text    "intro",        limit: 4294967295
    t.integer "introformat",  limit: 2,          default: 0,  null: false
    t.integer "numbering",    limit: 2,          default: 0,  null: false
    t.integer "customtitles", limit: 1,          default: 0,  null: false
    t.bigint  "revision",                        default: 0,  null: false
    t.bigint  "timecreated",                     default: 0,  null: false
    t.bigint  "timemodified",                    default: 0,  null: false
  end

  create_table "mdl_book_chapters", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Defines book_chapters" do |t|
    t.bigint  "bookid",                           default: 0,  null: false
    t.bigint  "pagenum",                          default: 0,  null: false
    t.bigint  "subchapter",                       default: 0,  null: false
    t.string  "title",                            default: "", null: false
    t.text    "content",       limit: 4294967295,              null: false
    t.integer "contentformat", limit: 2,          default: 0,  null: false
    t.integer "hidden",        limit: 1,          default: 0,  null: false
    t.bigint  "timecreated",                      default: 0,  null: false
    t.bigint  "timemodified",                     default: 0,  null: false
    t.string  "importsrc",                        default: "", null: false
  end

  create_table "mdl_cache_filters", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "For keeping information about cached data" do |t|
    t.string "filter",       limit: 32,         default: "", null: false
    t.bigint "version",                         default: 0,  null: false
    t.string "md5key",       limit: 32,         default: "", null: false
    t.text   "rawtext",      limit: 4294967295,              null: false
    t.bigint "timemodified",                    default: 0,  null: false
    t.index ["filter", "md5key"], name: "mdl_cachfilt_filmd5_ix", using: :btree
  end

  create_table "mdl_cache_flags", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Cache of time-sensitive flags" do |t|
    t.string "flagtype",                        default: "", null: false
    t.string "name",                            default: "", null: false
    t.bigint "timemodified",                    default: 0,  null: false
    t.text   "value",        limit: 4294967295,              null: false
    t.bigint "expiry",                                       null: false
    t.index ["flagtype"], name: "mdl_cachflag_fla_ix", using: :btree
    t.index ["name"], name: "mdl_cachflag_nam_ix", using: :btree
  end

  create_table "mdl_capabilities", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "this defines all capabilities" do |t|
    t.string "name",                     default: "", null: false
    t.string "captype",      limit: 50,  default: "", null: false
    t.bigint "contextlevel",             default: 0,  null: false
    t.string "component",    limit: 100, default: "", null: false
    t.bigint "riskbitmask",              default: 0,  null: false
    t.index ["name"], name: "mdl_capa_nam_uix", unique: true, using: :btree
  end

  create_table "mdl_chat", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Each of these is a chat room" do |t|
    t.bigint  "course",                          default: 0,  null: false
    t.string  "name",                            default: "", null: false
    t.text    "intro",        limit: 4294967295,              null: false
    t.integer "introformat",  limit: 2,          default: 0,  null: false
    t.bigint  "keepdays",                        default: 0,  null: false
    t.integer "studentlogs",  limit: 2,          default: 0,  null: false
    t.bigint  "chattime",                        default: 0,  null: false
    t.integer "schedule",     limit: 2,          default: 0,  null: false
    t.bigint  "timemodified",                    default: 0,  null: false
    t.index ["course"], name: "mdl_chat_cou_ix", using: :btree
  end

  create_table "mdl_chat_messages", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores all the actual chat messages" do |t|
    t.bigint  "chatid",                       default: 0,     null: false
    t.bigint  "userid",                       default: 0,     null: false
    t.bigint  "groupid",                      default: 0,     null: false
    t.boolean "system",                       default: false, null: false
    t.text    "message",   limit: 4294967295,                 null: false
    t.bigint  "timestamp",                    default: 0,     null: false
    t.index ["chatid"], name: "mdl_chatmess_cha_ix", using: :btree
    t.index ["groupid"], name: "mdl_chatmess_gro_ix", using: :btree
    t.index ["timestamp", "chatid"], name: "mdl_chatmess_timcha_ix", using: :btree
    t.index ["userid"], name: "mdl_chatmess_use_ix", using: :btree
  end

  create_table "mdl_chat_messages_current", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores current session" do |t|
    t.bigint  "chatid",                       default: 0,     null: false
    t.bigint  "userid",                       default: 0,     null: false
    t.bigint  "groupid",                      default: 0,     null: false
    t.boolean "system",                       default: false, null: false
    t.text    "message",   limit: 4294967295,                 null: false
    t.bigint  "timestamp",                    default: 0,     null: false
    t.index ["chatid"], name: "mdl_chatmesscurr_cha_ix", using: :btree
    t.index ["groupid"], name: "mdl_chatmesscurr_gro_ix", using: :btree
    t.index ["timestamp", "chatid"], name: "mdl_chatmesscurr_timcha_ix", using: :btree
    t.index ["userid"], name: "mdl_chatmesscurr_use_ix", using: :btree
  end

  create_table "mdl_chat_users", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Keeps track of which users are in which chat rooms" do |t|
    t.bigint "chatid",                     default: 0,  null: false
    t.bigint "userid",                     default: 0,  null: false
    t.bigint "groupid",                    default: 0,  null: false
    t.string "version",         limit: 16, default: "", null: false
    t.string "ip",              limit: 45, default: "", null: false
    t.bigint "firstping",                  default: 0,  null: false
    t.bigint "lastping",                   default: 0,  null: false
    t.bigint "lastmessageping",            default: 0,  null: false
    t.string "sid",             limit: 32, default: "", null: false
    t.bigint "course",                     default: 0,  null: false
    t.string "lang",            limit: 30, default: "", null: false
    t.index ["chatid"], name: "mdl_chatuser_cha_ix", using: :btree
    t.index ["groupid"], name: "mdl_chatuser_gro_ix", using: :btree
    t.index ["lastping"], name: "mdl_chatuser_las_ix", using: :btree
    t.index ["userid"], name: "mdl_chatuser_use_ix", using: :btree
  end

  create_table "mdl_choice", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Available choices are stored here" do |t|
    t.bigint  "course",                              default: 0,     null: false
    t.string  "name",                                default: "",    null: false
    t.text    "intro",            limit: 4294967295,                 null: false
    t.integer "introformat",      limit: 2,          default: 0,     null: false
    t.integer "publish",          limit: 1,          default: 0,     null: false
    t.integer "showresults",      limit: 1,          default: 0,     null: false
    t.integer "display",          limit: 2,          default: 0,     null: false
    t.integer "allowupdate",      limit: 1,          default: 0,     null: false
    t.integer "showunanswered",   limit: 1,          default: 0,     null: false
    t.integer "limitanswers",     limit: 1,          default: 0,     null: false
    t.bigint  "timeopen",                            default: 0,     null: false
    t.bigint  "timeclose",                           default: 0,     null: false
    t.bigint  "timemodified",                        default: 0,     null: false
    t.boolean "completionsubmit",                    default: false, null: false
    t.index ["course"], name: "mdl_choi_cou_ix", using: :btree
  end

  create_table "mdl_choice_answers", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "choices performed by users" do |t|
    t.bigint "choiceid",     default: 0, null: false
    t.bigint "userid",       default: 0, null: false
    t.bigint "optionid",     default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.index ["choiceid"], name: "mdl_choiansw_cho_ix", using: :btree
    t.index ["optionid"], name: "mdl_choiansw_opt_ix", using: :btree
    t.index ["userid"], name: "mdl_choiansw_use_ix", using: :btree
  end

  create_table "mdl_choice_options", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "available options to choice" do |t|
    t.bigint "choiceid",                        default: 0, null: false
    t.text   "text",         limit: 4294967295
    t.bigint "maxanswers",                      default: 0
    t.bigint "timemodified",                    default: 0, null: false
    t.index ["choiceid"], name: "mdl_choiopti_cho_ix", using: :btree
  end

  create_table "mdl_cohort", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Each record represents one cohort (aka site-wide group)." do |t|
    t.bigint  "contextid",                                         null: false
    t.string  "name",              limit: 254,        default: "", null: false
    t.string  "idnumber",          limit: 100
    t.text    "description",       limit: 4294967295
    t.integer "descriptionformat", limit: 1,                       null: false
    t.string  "component",         limit: 100,        default: "", null: false
    t.bigint  "timecreated",                                       null: false
    t.bigint  "timemodified",                                      null: false
    t.index ["contextid"], name: "mdl_coho_con_ix", using: :btree
  end

  create_table "mdl_cohort_members", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Link a user to a cohort." do |t|
    t.bigint "cohortid",  default: 0, null: false
    t.bigint "userid",    default: 0, null: false
    t.bigint "timeadded", default: 0, null: false
    t.index ["cohortid", "userid"], name: "mdl_cohomemb_cohuse_uix", unique: true, using: :btree
    t.index ["cohortid"], name: "mdl_cohomemb_coh_ix", using: :btree
    t.index ["userid"], name: "mdl_cohomemb_use_ix", using: :btree
  end

  create_table "mdl_comments", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "moodle comments module" do |t|
    t.bigint  "contextid",                                   null: false
    t.string  "commentarea",                    default: "", null: false
    t.bigint  "itemid",                                      null: false
    t.text    "content",     limit: 4294967295,              null: false
    t.integer "format",      limit: 1,          default: 0,  null: false
    t.bigint  "userid",                                      null: false
    t.bigint  "timecreated",                                 null: false
  end

  create_table "mdl_config", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Moodle configuration variables" do |t|
    t.string "name",                     default: "", null: false
    t.text   "value", limit: 4294967295,              null: false
    t.index ["name"], name: "mdl_conf_nam_uix", unique: true, using: :btree
  end

  create_table "mdl_config_log", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Changes done in server configuration through admin UI" do |t|
    t.bigint "userid",                                       null: false
    t.bigint "timemodified",                                 null: false
    t.string "plugin",       limit: 100
    t.string "name",         limit: 100,        default: "", null: false
    t.text   "value",        limit: 4294967295
    t.text   "oldvalue",     limit: 4294967295
    t.index ["timemodified"], name: "mdl_conflog_tim_ix", using: :btree
    t.index ["userid"], name: "mdl_conflog_use_ix", using: :btree
  end

  create_table "mdl_config_plugins", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Moodle modules and plugins configuration variables" do |t|
    t.string "plugin", limit: 100,        default: "core", null: false
    t.string "name",   limit: 100,        default: "",     null: false
    t.text   "value",  limit: 4294967295,                  null: false
    t.index ["plugin", "name"], name: "mdl_confplug_plunam_uix", unique: true, using: :btree
  end

  create_table "mdl_context", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "one of these must be set" do |t|
    t.bigint  "contextlevel",           default: 0, null: false
    t.bigint  "instanceid",             default: 0, null: false
    t.string  "path"
    t.integer "depth",        limit: 1, default: 0, null: false
    t.index ["contextlevel", "instanceid"], name: "mdl_cont_conins_uix", unique: true, using: :btree
    t.index ["instanceid"], name: "mdl_cont_ins_ix", using: :btree
    t.index ["path"], name: "mdl_cont_pat_ix", using: :btree
  end

  create_table "mdl_context_temp", id: :bigint, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Used by build_context_path() in upgrade and cron to keep con" do |t|
    t.string  "path",            default: "", null: false
    t.integer "depth", limit: 1,              null: false
  end

  create_table "mdl_course", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Central course table" do |t|
    t.bigint  "category",                             default: 0,        null: false
    t.bigint  "sortorder",                            default: 0,        null: false
    t.string  "fullname",          limit: 254,        default: "",       null: false
    t.string  "shortname",                            default: "",       null: false
    t.string  "idnumber",          limit: 100,        default: "",       null: false
    t.text    "summary",           limit: 4294967295
    t.integer "summaryformat",     limit: 1,          default: 0,        null: false
    t.string  "format",            limit: 21,         default: "topics", null: false
    t.integer "showgrades",        limit: 1,          default: 1,        null: false
    t.integer "newsitems",         limit: 3,          default: 1,        null: false
    t.bigint  "startdate",                            default: 0,        null: false
    t.bigint  "marker",                               default: 0,        null: false
    t.bigint  "maxbytes",                             default: 0,        null: false
    t.integer "legacyfiles",       limit: 2,          default: 0,        null: false
    t.integer "showreports",       limit: 2,          default: 0,        null: false
    t.boolean "visible",                              default: true,     null: false
    t.boolean "visibleold",                           default: true,     null: false
    t.integer "groupmode",         limit: 2,          default: 0,        null: false
    t.integer "groupmodeforce",    limit: 2,          default: 0,        null: false
    t.bigint  "defaultgroupingid",                    default: 0,        null: false
    t.string  "lang",              limit: 30,         default: "",       null: false
    t.string  "calendartype",      limit: 30,         default: "",       null: false
    t.string  "theme",             limit: 50,         default: "",       null: false
    t.bigint  "timecreated",                          default: 0,        null: false
    t.bigint  "timemodified",                         default: 0,        null: false
    t.boolean "requested",                            default: false,    null: false
    t.boolean "enablecompletion",                     default: false,    null: false
    t.boolean "completionnotify",                     default: false,    null: false
    t.bigint  "cacherev",                             default: 0,        null: false
    t.index ["category"], name: "mdl_cour_cat_ix", using: :btree
    t.index ["idnumber"], name: "mdl_cour_idn_ix", using: :btree
    t.index ["shortname"], name: "mdl_cour_sho_ix", using: :btree
    t.index ["sortorder"], name: "mdl_cour_sor_ix", using: :btree
  end

  create_table "mdl_course_categories", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Course categories" do |t|
    t.string  "name",                                 default: "",   null: false
    t.string  "idnumber",          limit: 100
    t.text    "description",       limit: 4294967295
    t.integer "descriptionformat", limit: 1,          default: 0,    null: false
    t.bigint  "parent",                               default: 0,    null: false
    t.bigint  "sortorder",                            default: 0,    null: false
    t.bigint  "coursecount",                          default: 0,    null: false
    t.boolean "visible",                              default: true, null: false
    t.boolean "visibleold",                           default: true, null: false
    t.bigint  "timemodified",                         default: 0,    null: false
    t.bigint  "depth",                                default: 0,    null: false
    t.string  "path",                                 default: "",   null: false
    t.string  "theme",             limit: 50
    t.index ["parent"], name: "mdl_courcate_par_ix", using: :btree
  end

  create_table "mdl_course_completion_aggr_methd", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Course completion aggregation methods for criteria" do |t|
    t.bigint  "course",                                default: 0,     null: false
    t.bigint  "criteriatype"
    t.boolean "method",                                default: false, null: false
    t.decimal "value",        precision: 10, scale: 5
    t.index ["course", "criteriatype"], name: "mdl_courcompaggrmeth_coucr_uix", unique: true, using: :btree
    t.index ["course"], name: "mdl_courcompaggrmeth_cou_ix", using: :btree
    t.index ["criteriatype"], name: "mdl_courcompaggrmeth_cri_ix", using: :btree
  end

  create_table "mdl_course_completion_crit_compl", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Course completion user records" do |t|
    t.bigint  "userid",                                 default: 0, null: false
    t.bigint  "course",                                 default: 0, null: false
    t.bigint  "criteriaid",                             default: 0, null: false
    t.decimal "gradefinal",    precision: 10, scale: 5
    t.bigint  "unenroled"
    t.bigint  "timecompleted"
    t.index ["course"], name: "mdl_courcompcritcomp_cou_ix", using: :btree
    t.index ["criteriaid"], name: "mdl_courcompcritcomp_cri_ix", using: :btree
    t.index ["timecompleted"], name: "mdl_courcompcritcomp_tim_ix", using: :btree
    t.index ["userid", "course", "criteriaid"], name: "mdl_courcompcritcomp_useco_uix", unique: true, using: :btree
    t.index ["userid"], name: "mdl_courcompcritcomp_use_ix", using: :btree
  end

  create_table "mdl_course_completion_criteria", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Course completion criteria" do |t|
    t.bigint  "course",                                              default: 0, null: false
    t.bigint  "criteriatype",                                        default: 0, null: false
    t.string  "module",         limit: 100
    t.bigint  "moduleinstance"
    t.bigint  "courseinstance"
    t.bigint  "enrolperiod"
    t.bigint  "timeend"
    t.decimal "gradepass",                  precision: 10, scale: 5
    t.bigint  "role"
    t.index ["course"], name: "mdl_courcompcrit_cou_ix", using: :btree
  end

  create_table "mdl_course_completions", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Course completion records" do |t|
    t.bigint "userid",        default: 0, null: false
    t.bigint "course",        default: 0, null: false
    t.bigint "timeenrolled",  default: 0, null: false
    t.bigint "timestarted",   default: 0, null: false
    t.bigint "timecompleted"
    t.bigint "reaggregate",   default: 0, null: false
    t.index ["course"], name: "mdl_courcomp_cou_ix", using: :btree
    t.index ["timecompleted"], name: "mdl_courcomp_tim_ix", using: :btree
    t.index ["userid", "course"], name: "mdl_courcomp_usecou_uix", unique: true, using: :btree
    t.index ["userid"], name: "mdl_courcomp_use_ix", using: :btree
  end

  create_table "mdl_course_format_options", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores format-specific options for the course or course sect" do |t|
    t.bigint "courseid",                                  null: false
    t.string "format",    limit: 21,         default: "", null: false
    t.bigint "sectionid",                    default: 0,  null: false
    t.string "name",      limit: 100,        default: "", null: false
    t.text   "value",     limit: 4294967295
    t.index ["courseid", "format", "sectionid", "name"], name: "mdl_courformopti_couforsec_uix", unique: true, using: :btree
    t.index ["courseid"], name: "mdl_courformopti_cou_ix", using: :btree
  end

  create_table "mdl_course_modules", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "course_modules table retrofitted from MySQL" do |t|
    t.bigint  "course",                                       default: 0,     null: false
    t.bigint  "module",                                       default: 0,     null: false
    t.bigint  "instance",                                     default: 0,     null: false
    t.bigint  "section",                                      default: 0,     null: false
    t.string  "idnumber",                  limit: 100
    t.bigint  "added",                                        default: 0,     null: false
    t.integer "score",                     limit: 2,          default: 0,     null: false
    t.integer "indent",                    limit: 3,          default: 0,     null: false
    t.boolean "visible",                                      default: true,  null: false
    t.boolean "visibleold",                                   default: true,  null: false
    t.integer "groupmode",                 limit: 2,          default: 0,     null: false
    t.bigint  "groupingid",                                   default: 0,     null: false
    t.integer "groupmembersonly",          limit: 2,          default: 0,     null: false
    t.boolean "completion",                                   default: false, null: false
    t.bigint  "completiongradeitemnumber"
    t.boolean "completionview",                               default: false, null: false
    t.bigint  "completionexpected",                           default: 0,     null: false
    t.boolean "showdescription",                              default: false, null: false
    t.text    "availability",              limit: 4294967295
    t.index ["course"], name: "mdl_courmodu_cou_ix", using: :btree
    t.index ["groupingid"], name: "mdl_courmodu_gro_ix", using: :btree
    t.index ["idnumber", "course"], name: "mdl_courmodu_idncou_ix", using: :btree
    t.index ["instance"], name: "mdl_courmodu_ins_ix", using: :btree
    t.index ["module"], name: "mdl_courmodu_mod_ix", using: :btree
    t.index ["visible"], name: "mdl_courmodu_vis_ix", using: :btree
  end

  create_table "mdl_course_modules_completion", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores the completion state (completed or not completed, etc" do |t|
    t.bigint  "coursemoduleid",  null: false
    t.bigint  "userid",          null: false
    t.boolean "completionstate", null: false
    t.boolean "viewed"
    t.bigint  "timemodified",    null: false
    t.index ["coursemoduleid"], name: "mdl_courmoducomp_cou_ix", using: :btree
    t.index ["userid", "coursemoduleid"], name: "mdl_courmoducomp_usecou_uix", unique: true, using: :btree
  end

  create_table "mdl_course_published", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Information about how and when an local courses were publish" do |t|
    t.string  "huburl"
    t.bigint  "courseid",                      null: false
    t.bigint  "timepublished",                 null: false
    t.boolean "enrollable",    default: true,  null: false
    t.bigint  "hubcourseid",                   null: false
    t.boolean "status",        default: false
    t.bigint  "timechecked"
  end

  create_table "mdl_course_request", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "course requests" do |t|
    t.string  "fullname",      limit: 254,        default: "", null: false
    t.string  "shortname",     limit: 100,        default: "", null: false
    t.text    "summary",       limit: 4294967295,              null: false
    t.integer "summaryformat", limit: 1,          default: 0,  null: false
    t.bigint  "category",                         default: 0,  null: false
    t.text    "reason",        limit: 4294967295,              null: false
    t.bigint  "requester",                        default: 0,  null: false
    t.string  "password",      limit: 50,         default: "", null: false
    t.index ["shortname"], name: "mdl_courrequ_sho_ix", using: :btree
  end

  create_table "mdl_course_sections", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "to define the sections for each course" do |t|
    t.bigint  "course",                           default: 0,    null: false
    t.bigint  "section",                          default: 0,    null: false
    t.string  "name"
    t.text    "summary",       limit: 4294967295
    t.integer "summaryformat", limit: 1,          default: 0,    null: false
    t.text    "sequence",      limit: 4294967295
    t.boolean "visible",                          default: true, null: false
    t.text    "availability",  limit: 4294967295
    t.index ["course", "section"], name: "mdl_coursect_cousec_uix", unique: true, using: :btree
  end

  create_table "mdl_data", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "all database activities" do |t|
    t.bigint  "course",                                   default: 0,  null: false
    t.string  "name",                                     default: "", null: false
    t.text    "intro",                 limit: 4294967295,              null: false
    t.integer "introformat",           limit: 2,          default: 0,  null: false
    t.integer "comments",              limit: 2,          default: 0,  null: false
    t.bigint  "timeavailablefrom",                        default: 0,  null: false
    t.bigint  "timeavailableto",                          default: 0,  null: false
    t.bigint  "timeviewfrom",                             default: 0,  null: false
    t.bigint  "timeviewto",                               default: 0,  null: false
    t.integer "requiredentries",                          default: 0,  null: false
    t.integer "requiredentriestoview",                    default: 0,  null: false
    t.integer "maxentries",                               default: 0,  null: false
    t.integer "rssarticles",           limit: 2,          default: 0,  null: false
    t.text    "singletemplate",        limit: 4294967295
    t.text    "listtemplate",          limit: 4294967295
    t.text    "listtemplateheader",    limit: 4294967295
    t.text    "listtemplatefooter",    limit: 4294967295
    t.text    "addtemplate",           limit: 4294967295
    t.text    "rsstemplate",           limit: 4294967295
    t.text    "rsstitletemplate",      limit: 4294967295
    t.text    "csstemplate",           limit: 4294967295
    t.text    "jstemplate",            limit: 4294967295
    t.text    "asearchtemplate",       limit: 4294967295
    t.integer "approval",              limit: 2,          default: 0,  null: false
    t.bigint  "scale",                                    default: 0,  null: false
    t.bigint  "assessed",                                 default: 0,  null: false
    t.bigint  "assesstimestart",                          default: 0,  null: false
    t.bigint  "assesstimefinish",                         default: 0,  null: false
    t.bigint  "defaultsort",                              default: 0,  null: false
    t.integer "defaultsortdir",        limit: 2,          default: 0,  null: false
    t.integer "editany",               limit: 2,          default: 0,  null: false
    t.bigint  "notification",                             default: 0,  null: false
    t.index ["course"], name: "mdl_data_cou_ix", using: :btree
  end

  create_table "mdl_data_content", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "the content introduced in each record/fields" do |t|
    t.bigint "fieldid",                     default: 0, null: false
    t.bigint "recordid",                    default: 0, null: false
    t.text   "content",  limit: 4294967295
    t.text   "content1", limit: 4294967295
    t.text   "content2", limit: 4294967295
    t.text   "content3", limit: 4294967295
    t.text   "content4", limit: 4294967295
    t.index ["fieldid"], name: "mdl_datacont_fie_ix", using: :btree
    t.index ["recordid"], name: "mdl_datacont_rec_ix", using: :btree
  end

  create_table "mdl_data_fields", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "every field available" do |t|
    t.bigint "dataid",                         default: 0,  null: false
    t.string "type",                           default: "", null: false
    t.string "name",                           default: "", null: false
    t.text   "description", limit: 4294967295,              null: false
    t.text   "param1",      limit: 4294967295
    t.text   "param2",      limit: 4294967295
    t.text   "param3",      limit: 4294967295
    t.text   "param4",      limit: 4294967295
    t.text   "param5",      limit: 4294967295
    t.text   "param6",      limit: 4294967295
    t.text   "param7",      limit: 4294967295
    t.text   "param8",      limit: 4294967295
    t.text   "param9",      limit: 4294967295
    t.text   "param10",     limit: 4294967295
    t.index ["dataid"], name: "mdl_datafiel_dat_ix", using: :btree
    t.index ["type", "dataid"], name: "mdl_datafiel_typdat_ix", using: :btree
  end

  create_table "mdl_data_records", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "every record introduced" do |t|
    t.bigint  "userid",                 default: 0, null: false
    t.bigint  "groupid",                default: 0, null: false
    t.bigint  "dataid",                 default: 0, null: false
    t.bigint  "timecreated",            default: 0, null: false
    t.bigint  "timemodified",           default: 0, null: false
    t.integer "approved",     limit: 2, default: 0, null: false
    t.index ["dataid"], name: "mdl_datareco_dat_ix", using: :btree
  end

  create_table "mdl_enrol", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Instances of enrolment plugins used in courses, fields marke" do |t|
    t.string  "enrol",           limit: 20,                                  default: "",    null: false
    t.bigint  "status",                                                      default: 0,     null: false
    t.bigint  "courseid",                                                                    null: false
    t.bigint  "sortorder",                                                   default: 0,     null: false
    t.string  "name"
    t.bigint  "enrolperiod",                                                 default: 0
    t.bigint  "enrolstartdate",                                              default: 0
    t.bigint  "enrolenddate",                                                default: 0
    t.boolean "expirynotify",                                                default: false
    t.bigint  "expirythreshold",                                             default: 0
    t.boolean "notifyall",                                                   default: false
    t.string  "password",        limit: 50
    t.string  "cost",            limit: 20
    t.string  "currency",        limit: 3
    t.bigint  "roleid",                                                      default: 0
    t.bigint  "customint1"
    t.bigint  "customint2"
    t.bigint  "customint3"
    t.bigint  "customint4"
    t.bigint  "customint5"
    t.bigint  "customint6"
    t.bigint  "customint7"
    t.bigint  "customint8"
    t.string  "customchar1"
    t.string  "customchar2"
    t.string  "customchar3",     limit: 1333
    t.decimal "customdec1",                         precision: 12, scale: 7
    t.decimal "customdec2",                         precision: 12, scale: 7
    t.text    "customtext1",     limit: 4294967295
    t.text    "customtext2",     limit: 4294967295
    t.text    "customtext3",     limit: 4294967295
    t.text    "customtext4",     limit: 4294967295
    t.bigint  "timecreated",                                                 default: 0,     null: false
    t.bigint  "timemodified",                                                default: 0,     null: false
    t.index ["courseid"], name: "mdl_enro_cou_ix", using: :btree
    t.index ["enrol"], name: "mdl_enro_enr_ix", using: :btree
  end

  create_table "mdl_enrol_flatfile", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "enrol_flatfile table retrofitted from MySQL" do |t|
    t.string "action",       limit: 30, default: "", null: false
    t.bigint "roleid",                               null: false
    t.bigint "userid",                               null: false
    t.bigint "courseid",                             null: false
    t.bigint "timestart",               default: 0,  null: false
    t.bigint "timeend",                 default: 0,  null: false
    t.bigint "timemodified",            default: 0,  null: false
    t.index ["courseid"], name: "mdl_enroflat_cou_ix", using: :btree
    t.index ["roleid"], name: "mdl_enroflat_rol_ix", using: :btree
    t.index ["userid"], name: "mdl_enroflat_use_ix", using: :btree
  end

  create_table "mdl_enrol_paypal", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Holds all known information about PayPal transactions" do |t|
    t.string "business",                       default: "", null: false
    t.string "receiver_email",                 default: "", null: false
    t.string "receiver_id",                    default: "", null: false
    t.string "item_name",                      default: "", null: false
    t.bigint "courseid",                       default: 0,  null: false
    t.bigint "userid",                         default: 0,  null: false
    t.bigint "instanceid",                     default: 0,  null: false
    t.string "memo",                           default: "", null: false
    t.string "tax",                            default: "", null: false
    t.string "option_name1",                   default: "", null: false
    t.string "option_selection1_x",            default: "", null: false
    t.string "option_name2",                   default: "", null: false
    t.string "option_selection2_x",            default: "", null: false
    t.string "payment_status",                 default: "", null: false
    t.string "pending_reason",                 default: "", null: false
    t.string "reason_code",         limit: 30, default: "", null: false
    t.string "txn_id",                         default: "", null: false
    t.string "parent_txn_id",                  default: "", null: false
    t.string "payment_type",        limit: 30, default: "", null: false
    t.bigint "timeupdated",                    default: 0,  null: false
  end

  create_table "mdl_event", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "For everything with a time associated to it" do |t|
    t.text    "name",           limit: 4294967295,              null: false
    t.text    "description",    limit: 4294967295,              null: false
    t.integer "format",         limit: 2,          default: 0,  null: false
    t.bigint  "courseid",                          default: 0,  null: false
    t.bigint  "groupid",                           default: 0,  null: false
    t.bigint  "userid",                            default: 0,  null: false
    t.bigint  "repeatid",                          default: 0,  null: false
    t.string  "modulename",     limit: 20,         default: "", null: false
    t.bigint  "instance",                          default: 0,  null: false
    t.string  "eventtype",      limit: 20,         default: "", null: false
    t.bigint  "timestart",                         default: 0,  null: false
    t.bigint  "timeduration",                      default: 0,  null: false
    t.integer "visible",        limit: 2,          default: 1,  null: false
    t.string  "uuid",                              default: "", null: false
    t.bigint  "sequence",                          default: 1,  null: false
    t.bigint  "timemodified",                      default: 0,  null: false
    t.bigint  "subscriptionid"
    t.index ["courseid"], name: "mdl_even_cou_ix", using: :btree
    t.index ["groupid", "courseid", "visible", "userid"], name: "mdl_even_grocouvisuse_ix", using: :btree
    t.index ["timeduration"], name: "mdl_even_tim2_ix", using: :btree
    t.index ["timestart"], name: "mdl_even_tim_ix", using: :btree
    t.index ["userid"], name: "mdl_even_use_ix", using: :btree
  end

  create_table "mdl_event_subscriptions", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Tracks subscriptions to remote calendars." do |t|
    t.string "url",                     default: "", null: false
    t.bigint "courseid",                default: 0,  null: false
    t.bigint "groupid",                 default: 0,  null: false
    t.bigint "userid",                  default: 0,  null: false
    t.string "eventtype",    limit: 20, default: "", null: false
    t.bigint "pollinterval",            default: 0,  null: false
    t.bigint "lastupdated"
    t.string "name",                    default: "", null: false
  end

  create_table "mdl_events_handlers", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This table is for storing which components requests what typ" do |t|
    t.string  "eventname",       limit: 166,        default: "", null: false
    t.string  "component",       limit: 166,        default: "", null: false
    t.string  "handlerfile",                        default: "", null: false
    t.text    "handlerfunction", limit: 4294967295
    t.string  "schedule"
    t.bigint  "status",                             default: 0,  null: false
    t.integer "internal",        limit: 1,          default: 1,  null: false
    t.index ["eventname", "component"], name: "mdl_evenhand_evecom_uix", unique: true, using: :btree
  end

  create_table "mdl_events_queue", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This table is for storing queued events. It stores only one " do |t|
    t.text   "eventdata",   limit: 4294967295, null: false
    t.text   "stackdump",   limit: 4294967295
    t.bigint "userid"
    t.bigint "timecreated",                    null: false
    t.index ["userid"], name: "mdl_evenqueu_use_ix", using: :btree
  end

  create_table "mdl_events_queue_handlers", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This is the list of queued handlers for processing. The even" do |t|
    t.bigint "queuedeventid",                    null: false
    t.bigint "handlerid",                        null: false
    t.bigint "status"
    t.text   "errormessage",  limit: 4294967295
    t.bigint "timemodified",                     null: false
    t.index ["handlerid"], name: "mdl_evenqueuhand_han_ix", using: :btree
    t.index ["queuedeventid"], name: "mdl_evenqueuhand_que_ix", using: :btree
  end

  create_table "mdl_external_functions", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "list of all external functions" do |t|
    t.string "name",         limit: 200, default: "", null: false
    t.string "classname",    limit: 100, default: "", null: false
    t.string "methodname",   limit: 100, default: "", null: false
    t.string "classpath"
    t.string "component",    limit: 100, default: "", null: false
    t.string "capabilities"
    t.index ["name"], name: "mdl_extefunc_nam_uix", unique: true, using: :btree
  end

  create_table "mdl_external_services", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "built in and custom external services" do |t|
    t.string  "name",               limit: 200, default: "",    null: false
    t.boolean "enabled",                                        null: false
    t.string  "requiredcapability", limit: 150
    t.boolean "restrictedusers",                                null: false
    t.string  "component",          limit: 100
    t.bigint  "timecreated",                                    null: false
    t.bigint  "timemodified"
    t.string  "shortname"
    t.boolean "downloadfiles",                  default: false, null: false
    t.boolean "uploadfiles",                    default: false, null: false
    t.index ["name"], name: "mdl_exteserv_nam_uix", unique: true, using: :btree
  end

  create_table "mdl_external_services_functions", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "lists functions available in each service group" do |t|
    t.bigint "externalserviceid",                          null: false
    t.string "functionname",      limit: 200, default: "", null: false
    t.index ["externalserviceid"], name: "mdl_exteservfunc_ext_ix", using: :btree
  end

  create_table "mdl_external_services_users", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "users allowed to use services with restricted users flag" do |t|
    t.bigint "externalserviceid", null: false
    t.bigint "userid",            null: false
    t.string "iprestriction"
    t.bigint "validuntil"
    t.bigint "timecreated"
    t.index ["externalserviceid"], name: "mdl_exteservuser_ext_ix", using: :btree
    t.index ["userid"], name: "mdl_exteservuser_use_ix", using: :btree
  end

  create_table "mdl_external_tokens", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Security tokens for accessing of external services" do |t|
    t.string  "token",             limit: 128, default: "", null: false
    t.integer "tokentype",         limit: 2,                null: false
    t.bigint  "userid",                                     null: false
    t.bigint  "externalserviceid",                          null: false
    t.string  "sid",               limit: 128
    t.bigint  "contextid",                                  null: false
    t.bigint  "creatorid",                     default: 1,  null: false
    t.string  "iprestriction"
    t.bigint  "validuntil"
    t.bigint  "timecreated",                                null: false
    t.bigint  "lastaccess"
    t.index ["contextid"], name: "mdl_extetoke_con_ix", using: :btree
    t.index ["creatorid"], name: "mdl_extetoke_cre_ix", using: :btree
    t.index ["externalserviceid"], name: "mdl_extetoke_ext_ix", using: :btree
    t.index ["userid"], name: "mdl_extetoke_use_ix", using: :btree
  end

  create_table "mdl_feedback", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "all feedbacks" do |t|
    t.bigint  "course",                                     default: 0,     null: false
    t.string  "name",                                       default: "",    null: false
    t.text    "intro",                   limit: 4294967295,                 null: false
    t.integer "introformat",             limit: 2,          default: 0,     null: false
    t.boolean "anonymous",                                  default: true,  null: false
    t.boolean "email_notification",                         default: true,  null: false
    t.boolean "multiple_submit",                            default: true,  null: false
    t.boolean "autonumbering",                              default: true,  null: false
    t.string  "site_after_submit",                          default: "",    null: false
    t.text    "page_after_submit",       limit: 4294967295,                 null: false
    t.integer "page_after_submitformat", limit: 1,          default: 0,     null: false
    t.boolean "publish_stats",                              default: false, null: false
    t.bigint  "timeopen",                                   default: 0,     null: false
    t.bigint  "timeclose",                                  default: 0,     null: false
    t.bigint  "timemodified",                               default: 0,     null: false
    t.boolean "completionsubmit",                           default: false, null: false
    t.index ["course"], name: "mdl_feed_cou_ix", using: :btree
  end

  create_table "mdl_feedback_completed", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "filled out feedback" do |t|
    t.bigint  "feedback",           default: 0,     null: false
    t.bigint  "userid",             default: 0,     null: false
    t.bigint  "timemodified",       default: 0,     null: false
    t.bigint  "random_response",    default: 0,     null: false
    t.boolean "anonymous_response", default: false, null: false
    t.index ["feedback"], name: "mdl_feedcomp_fee_ix", using: :btree
    t.index ["userid"], name: "mdl_feedcomp_use_ix", using: :btree
  end

  create_table "mdl_feedback_completedtmp", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "filled out feedback" do |t|
    t.bigint  "feedback",           default: 0,     null: false
    t.bigint  "userid",             default: 0,     null: false
    t.string  "guestid",            default: "",    null: false
    t.bigint  "timemodified",       default: 0,     null: false
    t.bigint  "random_response",    default: 0,     null: false
    t.boolean "anonymous_response", default: false, null: false
    t.index ["feedback"], name: "mdl_feedcomp_fee2_ix", using: :btree
    t.index ["userid"], name: "mdl_feedcomp_use2_ix", using: :btree
  end

  create_table "mdl_feedback_item", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "feedback_items" do |t|
    t.bigint  "feedback",                        default: 0,     null: false
    t.bigint  "template",                        default: 0,     null: false
    t.string  "name",                            default: "",    null: false
    t.string  "label",                           default: "",    null: false
    t.text    "presentation", limit: 4294967295,                 null: false
    t.string  "typ",                             default: "",    null: false
    t.boolean "hasvalue",                        default: false, null: false
    t.integer "position",     limit: 2,          default: 0,     null: false
    t.boolean "required",                        default: false, null: false
    t.bigint  "dependitem",                      default: 0,     null: false
    t.string  "dependvalue",                     default: "",    null: false
    t.string  "options",                         default: "",    null: false
    t.index ["feedback"], name: "mdl_feeditem_fee_ix", using: :btree
    t.index ["template"], name: "mdl_feeditem_tem_ix", using: :btree
  end

  create_table "mdl_feedback_sitecourse_map", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "feedback sitecourse map" do |t|
    t.bigint "feedbackid", default: 0, null: false
    t.bigint "courseid",   default: 0, null: false
    t.index ["courseid"], name: "mdl_feedsitemap_cou_ix", using: :btree
    t.index ["feedbackid"], name: "mdl_feedsitemap_fee_ix", using: :btree
  end

  create_table "mdl_feedback_template", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "templates of feedbackstructures" do |t|
    t.bigint  "course",   default: 0,     null: false
    t.boolean "ispublic", default: false, null: false
    t.string  "name",     default: "",    null: false
    t.index ["course"], name: "mdl_feedtemp_cou_ix", using: :btree
  end

  create_table "mdl_feedback_tracking", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "feedback trackingdata" do |t|
    t.bigint "userid",        default: 0, null: false
    t.bigint "feedback",      default: 0, null: false
    t.bigint "completed",     default: 0, null: false
    t.bigint "tmp_completed", default: 0, null: false
    t.index ["completed"], name: "mdl_feedtrac_com_ix", using: :btree
    t.index ["feedback"], name: "mdl_feedtrac_fee_ix", using: :btree
    t.index ["userid"], name: "mdl_feedtrac_use_ix", using: :btree
  end

  create_table "mdl_feedback_value", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "values of the completeds" do |t|
    t.bigint "course_id",                        default: 0, null: false
    t.bigint "item",                             default: 0, null: false
    t.bigint "completed",                        default: 0, null: false
    t.bigint "tmp_completed",                    default: 0, null: false
    t.text   "value",         limit: 4294967295,             null: false
    t.index ["course_id"], name: "mdl_feedvalu_cou_ix", using: :btree
    t.index ["item"], name: "mdl_feedvalu_ite_ix", using: :btree
  end

  create_table "mdl_feedback_valuetmp", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "values of the completedstmp" do |t|
    t.bigint "course_id",                        default: 0, null: false
    t.bigint "item",                             default: 0, null: false
    t.bigint "completed",                        default: 0, null: false
    t.bigint "tmp_completed",                    default: 0, null: false
    t.text   "value",         limit: 4294967295,             null: false
    t.index ["course_id"], name: "mdl_feedvalu_cou2_ix", using: :btree
    t.index ["item"], name: "mdl_feedvalu_ite2_ix", using: :btree
  end

  create_table "mdl_files", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "description of files, content is stored in sha1 file pool" do |t|
    t.string "contenthash",     limit: 40,         default: "", null: false
    t.string "pathnamehash",    limit: 40,         default: "", null: false
    t.bigint "contextid",                                       null: false
    t.string "component",       limit: 100,        default: "", null: false
    t.string "filearea",        limit: 50,         default: "", null: false
    t.bigint "itemid",                                          null: false
    t.string "filepath",                           default: "", null: false
    t.string "filename",                           default: "", null: false
    t.bigint "userid"
    t.bigint "filesize",                                        null: false
    t.string "mimetype",        limit: 100
    t.bigint "status",                             default: 0,  null: false
    t.text   "source",          limit: 4294967295
    t.string "author"
    t.string "license"
    t.bigint "timecreated",                                     null: false
    t.bigint "timemodified",                                    null: false
    t.bigint "sortorder",                          default: 0,  null: false
    t.bigint "referencefileid"
    t.index ["component", "filearea", "contextid", "itemid"], name: "mdl_file_comfilconite_ix", using: :btree
    t.index ["contenthash"], name: "mdl_file_con_ix", using: :btree
    t.index ["contextid"], name: "mdl_file_con2_ix", using: :btree
    t.index ["pathnamehash"], name: "mdl_file_pat_uix", unique: true, using: :btree
    t.index ["referencefileid"], name: "mdl_file_ref_ix", using: :btree
    t.index ["userid"], name: "mdl_file_use_ix", using: :btree
  end

  create_table "mdl_files_reference", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Store files references" do |t|
    t.bigint "repositoryid",                                  null: false
    t.bigint "lastsync"
    t.text   "reference",     limit: 4294967295
    t.string "referencehash", limit: 40,         default: "", null: false
    t.index ["referencehash", "repositoryid"], name: "mdl_filerefe_refrep_uix", unique: true, using: :btree
    t.index ["repositoryid"], name: "mdl_filerefe_rep_ix", using: :btree
  end

  create_table "mdl_filter_active", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores information about which filters are active in which c" do |t|
    t.string  "filter",    limit: 32, default: "", null: false
    t.bigint  "contextid",                         null: false
    t.integer "active",    limit: 2,               null: false
    t.bigint  "sortorder",            default: 0,  null: false
    t.index ["contextid", "filter"], name: "mdl_filtacti_confil_uix", unique: true, using: :btree
    t.index ["contextid"], name: "mdl_filtacti_con_ix", using: :btree
  end

  create_table "mdl_filter_config", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores per-context configuration settings for filters which " do |t|
    t.string "filter",    limit: 32,         default: "", null: false
    t.bigint "contextid",                                 null: false
    t.string "name",                         default: "", null: false
    t.text   "value",     limit: 4294967295
    t.index ["contextid", "filter", "name"], name: "mdl_filtconf_confilnam_uix", unique: true, using: :btree
    t.index ["contextid"], name: "mdl_filtconf_con_ix", using: :btree
  end

  create_table "mdl_folder", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "each record is one folder resource" do |t|
    t.bigint  "course",                          default: 0,    null: false
    t.string  "name",                            default: "",   null: false
    t.text    "intro",        limit: 4294967295
    t.integer "introformat",  limit: 2,          default: 0,    null: false
    t.bigint  "revision",                        default: 0,    null: false
    t.bigint  "timemodified",                    default: 0,    null: false
    t.integer "display",      limit: 2,          default: 0,    null: false
    t.boolean "showexpanded",                    default: true, null: false
    t.index ["course"], name: "mdl_fold_cou_ix", using: :btree
  end

  create_table "mdl_forum", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Forums contain and structure discussion" do |t|
    t.bigint  "course",                                   default: 0,         null: false
    t.string  "name",                                     default: "",        null: false
    t.text    "intro",                 limit: 4294967295,                     null: false
    t.integer "introformat",           limit: 2,          default: 0,         null: false
    t.bigint  "assessed",                                 default: 0,         null: false
    t.bigint  "assesstimestart",                          default: 0,         null: false
    t.bigint  "assesstimefinish",                         default: 0,         null: false
    t.bigint  "scale",                                    default: 0,         null: false
    t.bigint  "maxbytes",                                 default: 0,         null: false
    t.bigint  "maxattachments",                           default: 1,         null: false
    t.boolean "forcesubscribe",                           default: false,     null: false
    t.integer "trackingtype",          limit: 1,          default: 1,         null: false
    t.integer "rsstype",               limit: 1,          default: 0,         null: false
    t.integer "rssarticles",           limit: 1,          default: 0,         null: false
    t.bigint  "timemodified",                             default: 0,         null: false
    t.bigint  "warnafter",                                default: 0,         null: false
    t.bigint  "blockafter",                               default: 0,         null: false
    t.bigint  "blockperiod",                              default: 0,         null: false
    t.integer "completiondiscussions",                    default: 0,         null: false
    t.integer "completionreplies",                        default: 0,         null: false
    t.integer "completionposts",                          default: 0,         null: false
    t.boolean "displaywordcount",                         default: false,     null: false
    t.index ["course"], name: "mdl_foru_cou_ix", using: :btree
  end

  create_table "mdl_forum_digests", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Keeps track of user mail delivery preferences for each forum" do |t|
    t.bigint  "userid",                    null: false
    t.bigint  "forum",                     null: false
    t.boolean "maildigest", default: true, null: false
    t.index ["forum", "userid", "maildigest"], name: "mdl_forudige_forusemai_uix", unique: true, using: :btree
    t.index ["forum"], name: "mdl_forudige_for_ix", using: :btree
    t.index ["userid"], name: "mdl_forudige_use_ix", using: :btree
  end

  create_table "mdl_forum_discussions", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Forums are composed of discussions" do |t|
    t.bigint  "course",       default: 0,    null: false
    t.bigint  "forum",        default: 0,    null: false
    t.string  "name",         default: "",   null: false
    t.bigint  "firstpost",    default: 0,    null: false
    t.bigint  "userid",       default: 0,    null: false
    t.bigint  "groupid",      default: -1,   null: false
    t.boolean "assessed",     default: true, null: false
    t.bigint  "timemodified", default: 0,    null: false
    t.bigint  "usermodified", default: 0,    null: false
    t.bigint  "timestart",    default: 0,    null: false
    t.bigint  "timeend",      default: 0,    null: false
    t.index ["forum"], name: "mdl_forudisc_for_ix", using: :btree
    t.index ["userid"], name: "mdl_forudisc_use_ix", using: :btree
  end

  create_table "mdl_forum_posts", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "All posts are stored in this table" do |t|
    t.bigint  "discussion",                       default: 0,  null: false
    t.bigint  "parent",                           default: 0,  null: false
    t.bigint  "userid",                           default: 0,  null: false
    t.bigint  "created",                          default: 0,  null: false
    t.bigint  "modified",                         default: 0,  null: false
    t.integer "mailed",        limit: 1,          default: 0,  null: false
    t.string  "subject",                          default: "", null: false
    t.text    "message",       limit: 4294967295,              null: false
    t.integer "messageformat", limit: 1,          default: 0,  null: false
    t.integer "messagetrust",  limit: 1,          default: 0,  null: false
    t.string  "attachment",    limit: 100,        default: "", null: false
    t.integer "totalscore",    limit: 2,          default: 0,  null: false
    t.bigint  "mailnow",                          default: 0,  null: false
    t.index ["created"], name: "mdl_forupost_cre_ix", using: :btree
    t.index ["discussion"], name: "mdl_forupost_dis_ix", using: :btree
    t.index ["mailed"], name: "mdl_forupost_mai_ix", using: :btree
    t.index ["parent"], name: "mdl_forupost_par_ix", using: :btree
    t.index ["userid"], name: "mdl_forupost_use_ix", using: :btree
  end

  create_table "mdl_forum_queue", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "For keeping track of posts that will be mailed in digest for" do |t|
    t.bigint "userid",       default: 0, null: false
    t.bigint "discussionid", default: 0, null: false
    t.bigint "postid",       default: 0, null: false
    t.bigint "timemodified", default: 0, null: false
    t.index ["discussionid"], name: "mdl_foruqueu_dis_ix", using: :btree
    t.index ["postid"], name: "mdl_foruqueu_pos_ix", using: :btree
    t.index ["userid"], name: "mdl_foruqueu_use_ix", using: :btree
  end

  create_table "mdl_forum_read", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Tracks each users read posts" do |t|
    t.bigint "userid",       default: 0, null: false
    t.bigint "forumid",      default: 0, null: false
    t.bigint "discussionid", default: 0, null: false
    t.bigint "postid",       default: 0, null: false
    t.bigint "firstread",    default: 0, null: false
    t.bigint "lastread",     default: 0, null: false
    t.index ["postid", "userid"], name: "mdl_foruread_posuse_ix", using: :btree
    t.index ["userid", "discussionid"], name: "mdl_foruread_usedis_ix", using: :btree
    t.index ["userid", "forumid"], name: "mdl_foruread_usefor_ix", using: :btree
  end

  create_table "mdl_forum_subscriptions", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Keeps track of who is subscribed to what forum" do |t|
    t.bigint "userid", default: 0, null: false
    t.bigint "forum",  default: 0, null: false
    t.index ["forum"], name: "mdl_forusubs_for_ix", using: :btree
    t.index ["userid"], name: "mdl_forusubs_use_ix", using: :btree
  end

  create_table "mdl_forum_track_prefs", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Tracks each users untracked forums" do |t|
    t.bigint "userid",  default: 0, null: false
    t.bigint "forumid", default: 0, null: false
    t.index ["userid", "forumid"], name: "mdl_forutracpref_usefor_ix", using: :btree
  end

  create_table "mdl_glossary", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "all glossaries" do |t|
    t.bigint  "course",                                    default: 0,            null: false
    t.string  "name",                                      default: "",           null: false
    t.text    "intro",                  limit: 4294967295,                        null: false
    t.integer "introformat",            limit: 2,          default: 0,            null: false
    t.integer "allowduplicatedentries", limit: 1,          default: 0,            null: false
    t.string  "displayformat",          limit: 50,         default: "dictionary", null: false
    t.integer "mainglossary",           limit: 1,          default: 0,            null: false
    t.integer "showspecial",            limit: 1,          default: 1,            null: false
    t.integer "showalphabet",           limit: 1,          default: 1,            null: false
    t.integer "showall",                limit: 1,          default: 1,            null: false
    t.integer "allowcomments",          limit: 1,          default: 0,            null: false
    t.integer "allowprintview",         limit: 1,          default: 1,            null: false
    t.integer "usedynalink",            limit: 1,          default: 1,            null: false
    t.integer "defaultapproval",        limit: 1,          default: 1,            null: false
    t.string  "approvaldisplayformat",  limit: 50,         default: "default",    null: false
    t.integer "globalglossary",         limit: 1,          default: 0,            null: false
    t.integer "entbypage",              limit: 2,          default: 10,           null: false
    t.integer "editalways",             limit: 1,          default: 0,            null: false
    t.integer "rsstype",                limit: 1,          default: 0,            null: false
    t.integer "rssarticles",            limit: 1,          default: 0,            null: false
    t.bigint  "assessed",                                  default: 0,            null: false
    t.bigint  "assesstimestart",                           default: 0,            null: false
    t.bigint  "assesstimefinish",                          default: 0,            null: false
    t.bigint  "scale",                                     default: 0,            null: false
    t.bigint  "timecreated",                               default: 0,            null: false
    t.bigint  "timemodified",                              default: 0,            null: false
    t.integer "completionentries",                         default: 0,            null: false
    t.index ["course"], name: "mdl_glos_cou_ix", using: :btree
  end

  create_table "mdl_glossary_alias", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "entries alias" do |t|
    t.bigint "entryid", default: 0,  null: false
    t.string "alias",   default: "", null: false
    t.index ["entryid"], name: "mdl_glosalia_ent_ix", using: :btree
  end

  create_table "mdl_glossary_categories", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "all categories for glossary entries" do |t|
    t.bigint  "glossaryid",            default: 0,  null: false
    t.string  "name",                  default: "", null: false
    t.integer "usedynalink", limit: 1, default: 1,  null: false
    t.index ["glossaryid"], name: "mdl_gloscate_glo_ix", using: :btree
  end

  create_table "mdl_glossary_entries", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "all glossary entries" do |t|
    t.bigint  "glossaryid",                          default: 0,  null: false
    t.bigint  "userid",                              default: 0,  null: false
    t.string  "concept",                             default: "", null: false
    t.text    "definition",       limit: 4294967295,              null: false
    t.integer "definitionformat", limit: 1,          default: 0,  null: false
    t.integer "definitiontrust",  limit: 1,          default: 0,  null: false
    t.string  "attachment",       limit: 100,        default: "", null: false
    t.bigint  "timecreated",                         default: 0,  null: false
    t.bigint  "timemodified",                        default: 0,  null: false
    t.integer "teacherentry",     limit: 1,          default: 0,  null: false
    t.bigint  "sourceglossaryid",                    default: 0,  null: false
    t.integer "usedynalink",      limit: 1,          default: 1,  null: false
    t.integer "casesensitive",    limit: 1,          default: 0,  null: false
    t.integer "fullmatch",        limit: 1,          default: 1,  null: false
    t.integer "approved",         limit: 1,          default: 1,  null: false
    t.index ["concept"], name: "mdl_glosentr_con_ix", using: :btree
    t.index ["glossaryid"], name: "mdl_glosentr_glo_ix", using: :btree
    t.index ["userid"], name: "mdl_glosentr_use_ix", using: :btree
  end

  create_table "mdl_glossary_entries_categories", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "categories of each glossary entry" do |t|
    t.bigint "categoryid", default: 0, null: false
    t.bigint "entryid",    default: 0, null: false
    t.index ["categoryid"], name: "mdl_glosentrcate_cat_ix", using: :btree
    t.index ["entryid"], name: "mdl_glosentrcate_ent_ix", using: :btree
  end

  create_table "mdl_glossary_formats", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Setting of the display formats" do |t|
    t.string  "name",            limit: 50, default: "", null: false
    t.string  "popupformatname", limit: 50, default: "", null: false
    t.integer "visible",         limit: 1,  default: 1,  null: false
    t.integer "showgroup",       limit: 1,  default: 1,  null: false
    t.string  "defaultmode",     limit: 50, default: "", null: false
    t.string  "defaulthook",     limit: 50, default: "", null: false
    t.string  "sortkey",         limit: 50, default: "", null: false
    t.string  "sortorder",       limit: 50, default: "", null: false
  end

  create_table "mdl_grade_categories", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This table keeps information about categories, used for grou" do |t|
    t.bigint  "courseid",                            null: false
    t.bigint  "parent"
    t.bigint  "depth",               default: 0,     null: false
    t.string  "path"
    t.string  "fullname",            default: "",    null: false
    t.bigint  "aggregation",         default: 0,     null: false
    t.bigint  "keephigh",            default: 0,     null: false
    t.bigint  "droplow",             default: 0,     null: false
    t.boolean "aggregateonlygraded", default: false, null: false
    t.boolean "aggregateoutcomes",   default: false, null: false
    t.boolean "aggregatesubcats",    default: false, null: false
    t.bigint  "timecreated",                         null: false
    t.bigint  "timemodified",                        null: false
    t.boolean "hidden",              default: false, null: false
    t.index ["courseid"], name: "mdl_gradcate_cou_ix", using: :btree
    t.index ["parent"], name: "mdl_gradcate_par_ix", using: :btree
  end

  create_table "mdl_grade_categories_history", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "History of grade_categories" do |t|
    t.bigint  "action",              default: 0,     null: false
    t.bigint  "oldid",                               null: false
    t.string  "source"
    t.bigint  "timemodified"
    t.bigint  "loggeduser"
    t.bigint  "courseid",                            null: false
    t.bigint  "parent"
    t.bigint  "depth",               default: 0,     null: false
    t.string  "path"
    t.string  "fullname",            default: "",    null: false
    t.bigint  "aggregation",         default: 0,     null: false
    t.bigint  "keephigh",            default: 0,     null: false
    t.bigint  "droplow",             default: 0,     null: false
    t.boolean "aggregateonlygraded", default: false, null: false
    t.boolean "aggregateoutcomes",   default: false, null: false
    t.boolean "aggregatesubcats",    default: false, null: false
    t.boolean "hidden",              default: false, null: false
    t.index ["action"], name: "mdl_gradcatehist_act_ix", using: :btree
    t.index ["courseid"], name: "mdl_gradcatehist_cou_ix", using: :btree
    t.index ["loggeduser"], name: "mdl_gradcatehist_log_ix", using: :btree
    t.index ["oldid"], name: "mdl_gradcatehist_old_ix", using: :btree
    t.index ["parent"], name: "mdl_gradcatehist_par_ix", using: :btree
  end

  create_table "mdl_grade_grades", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "grade_grades  This table keeps individual grades for each us" do |t|
    t.bigint  "itemid",                                                                          null: false
    t.bigint  "userid",                                                                          null: false
    t.decimal "rawgrade",                             precision: 10, scale: 5
    t.decimal "rawgrademax",                          precision: 10, scale: 5, default: "100.0", null: false
    t.decimal "rawgrademin",                          precision: 10, scale: 5, default: "0.0",   null: false
    t.bigint  "rawscaleid"
    t.bigint  "usermodified"
    t.decimal "finalgrade",                           precision: 10, scale: 5
    t.bigint  "hidden",                                                        default: 0,       null: false
    t.bigint  "locked",                                                        default: 0,       null: false
    t.bigint  "locktime",                                                      default: 0,       null: false
    t.bigint  "exported",                                                      default: 0,       null: false
    t.bigint  "overridden",                                                    default: 0,       null: false
    t.bigint  "excluded",                                                      default: 0,       null: false
    t.text    "feedback",          limit: 4294967295
    t.bigint  "feedbackformat",                                                default: 0,       null: false
    t.text    "information",       limit: 4294967295
    t.bigint  "informationformat",                                             default: 0,       null: false
    t.bigint  "timecreated"
    t.bigint  "timemodified"
    t.index ["itemid"], name: "mdl_gradgrad_ite_ix", using: :btree
    t.index ["locked", "locktime"], name: "mdl_gradgrad_locloc_ix", using: :btree
    t.index ["rawscaleid"], name: "mdl_gradgrad_raw_ix", using: :btree
    t.index ["userid", "itemid"], name: "mdl_gradgrad_useite_uix", unique: true, using: :btree
    t.index ["userid"], name: "mdl_gradgrad_use_ix", using: :btree
    t.index ["usermodified"], name: "mdl_gradgrad_use2_ix", using: :btree
  end

  create_table "mdl_grade_grades_history", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "History table" do |t|
    t.bigint  "action",                                                        default: 0,       null: false
    t.bigint  "oldid",                                                                           null: false
    t.string  "source"
    t.bigint  "timemodified"
    t.bigint  "loggeduser"
    t.bigint  "itemid",                                                                          null: false
    t.bigint  "userid",                                                                          null: false
    t.decimal "rawgrade",                             precision: 10, scale: 5
    t.decimal "rawgrademax",                          precision: 10, scale: 5, default: "100.0", null: false
    t.decimal "rawgrademin",                          precision: 10, scale: 5, default: "0.0",   null: false
    t.bigint  "rawscaleid"
    t.bigint  "usermodified"
    t.decimal "finalgrade",                           precision: 10, scale: 5
    t.bigint  "hidden",                                                        default: 0,       null: false
    t.bigint  "locked",                                                        default: 0,       null: false
    t.bigint  "locktime",                                                      default: 0,       null: false
    t.bigint  "exported",                                                      default: 0,       null: false
    t.bigint  "overridden",                                                    default: 0,       null: false
    t.bigint  "excluded",                                                      default: 0,       null: false
    t.text    "feedback",          limit: 4294967295
    t.bigint  "feedbackformat",                                                default: 0,       null: false
    t.text    "information",       limit: 4294967295
    t.bigint  "informationformat",                                             default: 0,       null: false
    t.index ["action"], name: "mdl_gradgradhist_act_ix", using: :btree
    t.index ["itemid"], name: "mdl_gradgradhist_ite_ix", using: :btree
    t.index ["loggeduser"], name: "mdl_gradgradhist_log_ix", using: :btree
    t.index ["oldid"], name: "mdl_gradgradhist_old_ix", using: :btree
    t.index ["rawscaleid"], name: "mdl_gradgradhist_raw_ix", using: :btree
    t.index ["timemodified"], name: "mdl_gradgradhist_tim_ix", using: :btree
    t.index ["userid"], name: "mdl_gradgradhist_use_ix", using: :btree
    t.index ["usermodified"], name: "mdl_gradgradhist_use2_ix", using: :btree
  end

  create_table "mdl_grade_import_newitem", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "temporary table for storing new grade_item names from grade " do |t|
    t.string "itemname",   default: "", null: false
    t.bigint "importcode",              null: false
    t.bigint "importer",                null: false
    t.index ["importer"], name: "mdl_gradimponewi_imp_ix", using: :btree
  end

  create_table "mdl_grade_import_values", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Temporary table for importing grades" do |t|
    t.bigint  "itemid"
    t.bigint  "newgradeitem"
    t.bigint  "userid",                                                   null: false
    t.decimal "finalgrade",                      precision: 10, scale: 5
    t.text    "feedback",     limit: 4294967295
    t.bigint  "importcode",                                               null: false
    t.bigint  "importer"
    t.index ["importer"], name: "mdl_gradimpovalu_imp_ix", using: :btree
    t.index ["itemid"], name: "mdl_gradimpovalu_ite_ix", using: :btree
    t.index ["newgradeitem"], name: "mdl_gradimpovalu_new_ix", using: :btree
  end

  create_table "mdl_grade_items", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This table keeps information about gradeable items (ie colum" do |t|
    t.bigint  "courseid"
    t.bigint  "categoryid"
    t.string  "itemname"
    t.string  "itemtype",        limit: 30,                                  default: "",      null: false
    t.string  "itemmodule",      limit: 30
    t.bigint  "iteminstance"
    t.bigint  "itemnumber"
    t.text    "iteminfo",        limit: 4294967295
    t.string  "idnumber"
    t.text    "calculation",     limit: 4294967295
    t.integer "gradetype",       limit: 2,                                   default: 1,       null: false
    t.decimal "grademax",                           precision: 10, scale: 5, default: "100.0", null: false
    t.decimal "grademin",                           precision: 10, scale: 5, default: "0.0",   null: false
    t.bigint  "scaleid"
    t.bigint  "outcomeid"
    t.decimal "gradepass",                          precision: 10, scale: 5, default: "0.0",   null: false
    t.decimal "multfactor",                         precision: 10, scale: 5, default: "1.0",   null: false
    t.decimal "plusfactor",                         precision: 10, scale: 5, default: "0.0",   null: false
    t.decimal "aggregationcoef",                    precision: 10, scale: 5, default: "0.0",   null: false
    t.bigint  "sortorder",                                                   default: 0,       null: false
    t.bigint  "display",                                                     default: 0,       null: false
    t.boolean "decimals"
    t.bigint  "hidden",                                                      default: 0,       null: false
    t.bigint  "locked",                                                      default: 0,       null: false
    t.bigint  "locktime",                                                    default: 0,       null: false
    t.bigint  "needsupdate",                                                 default: 0,       null: false
    t.bigint  "timecreated"
    t.bigint  "timemodified"
    t.index ["categoryid"], name: "mdl_graditem_cat_ix", using: :btree
    t.index ["courseid"], name: "mdl_graditem_cou_ix", using: :btree
    t.index ["gradetype"], name: "mdl_graditem_gra_ix", using: :btree
    t.index ["idnumber", "courseid"], name: "mdl_graditem_idncou_ix", using: :btree
    t.index ["itemtype", "needsupdate"], name: "mdl_graditem_itenee_ix", using: :btree
    t.index ["locked", "locktime"], name: "mdl_graditem_locloc_ix", using: :btree
    t.index ["outcomeid"], name: "mdl_graditem_out_ix", using: :btree
    t.index ["scaleid"], name: "mdl_graditem_sca_ix", using: :btree
  end

  create_table "mdl_grade_items_history", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "History of grade_items" do |t|
    t.bigint  "action",                                                      default: 0,       null: false
    t.bigint  "oldid",                                                                         null: false
    t.string  "source"
    t.bigint  "timemodified"
    t.bigint  "loggeduser"
    t.bigint  "courseid"
    t.bigint  "categoryid"
    t.string  "itemname"
    t.string  "itemtype",        limit: 30,                                  default: "",      null: false
    t.string  "itemmodule",      limit: 30
    t.bigint  "iteminstance"
    t.bigint  "itemnumber"
    t.text    "iteminfo",        limit: 4294967295
    t.string  "idnumber"
    t.text    "calculation",     limit: 4294967295
    t.integer "gradetype",       limit: 2,                                   default: 1,       null: false
    t.decimal "grademax",                           precision: 10, scale: 5, default: "100.0", null: false
    t.decimal "grademin",                           precision: 10, scale: 5, default: "0.0",   null: false
    t.bigint  "scaleid"
    t.bigint  "outcomeid"
    t.decimal "gradepass",                          precision: 10, scale: 5, default: "0.0",   null: false
    t.decimal "multfactor",                         precision: 10, scale: 5, default: "1.0",   null: false
    t.decimal "plusfactor",                         precision: 10, scale: 5, default: "0.0",   null: false
    t.decimal "aggregationcoef",                    precision: 10, scale: 5, default: "0.0",   null: false
    t.bigint  "sortorder",                                                   default: 0,       null: false
    t.bigint  "hidden",                                                      default: 0,       null: false
    t.bigint  "locked",                                                      default: 0,       null: false
    t.bigint  "locktime",                                                    default: 0,       null: false
    t.bigint  "needsupdate",                                                 default: 0,       null: false
    t.bigint  "display",                                                     default: 0,       null: false
    t.boolean "decimals"
    t.index ["action"], name: "mdl_graditemhist_act_ix", using: :btree
    t.index ["categoryid"], name: "mdl_graditemhist_cat_ix", using: :btree
    t.index ["courseid"], name: "mdl_graditemhist_cou_ix", using: :btree
    t.index ["loggeduser"], name: "mdl_graditemhist_log_ix", using: :btree
    t.index ["oldid"], name: "mdl_graditemhist_old_ix", using: :btree
    t.index ["outcomeid"], name: "mdl_graditemhist_out_ix", using: :btree
    t.index ["scaleid"], name: "mdl_graditemhist_sca_ix", using: :btree
  end

  create_table "mdl_grade_letters", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Repository for grade letters, for courses and other moodle e" do |t|
    t.bigint  "contextid",                                           null: false
    t.decimal "lowerboundary", precision: 10, scale: 5,              null: false
    t.string  "letter",                                 default: "", null: false
    t.index ["contextid", "lowerboundary", "letter"], name: "mdl_gradlett_conlowlet_uix", unique: true, using: :btree
  end

  create_table "mdl_grade_outcomes", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This table describes the outcomes used in the system. An out" do |t|
    t.bigint  "courseid"
    t.string  "shortname",                            default: "", null: false
    t.text    "fullname",          limit: 4294967295,              null: false
    t.bigint  "scaleid"
    t.text    "description",       limit: 4294967295
    t.integer "descriptionformat", limit: 1,          default: 0,  null: false
    t.bigint  "timecreated"
    t.bigint  "timemodified"
    t.bigint  "usermodified"
    t.index ["courseid", "shortname"], name: "mdl_gradoutc_cousho_uix", unique: true, using: :btree
    t.index ["courseid"], name: "mdl_gradoutc_cou_ix", using: :btree
    t.index ["scaleid"], name: "mdl_gradoutc_sca_ix", using: :btree
    t.index ["usermodified"], name: "mdl_gradoutc_use_ix", using: :btree
  end

  create_table "mdl_grade_outcomes_courses", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "stores what outcomes are used in what courses." do |t|
    t.bigint "courseid",  null: false
    t.bigint "outcomeid", null: false
    t.index ["courseid", "outcomeid"], name: "mdl_gradoutccour_couout_uix", unique: true, using: :btree
    t.index ["courseid"], name: "mdl_gradoutccour_cou_ix", using: :btree
    t.index ["outcomeid"], name: "mdl_gradoutccour_out_ix", using: :btree
  end

  create_table "mdl_grade_outcomes_history", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "History table" do |t|
    t.bigint  "action",                               default: 0,  null: false
    t.bigint  "oldid",                                             null: false
    t.string  "source"
    t.bigint  "timemodified"
    t.bigint  "loggeduser"
    t.bigint  "courseid"
    t.string  "shortname",                            default: "", null: false
    t.text    "fullname",          limit: 4294967295,              null: false
    t.bigint  "scaleid"
    t.text    "description",       limit: 4294967295
    t.integer "descriptionformat", limit: 1,          default: 0,  null: false
    t.index ["action"], name: "mdl_gradoutchist_act_ix", using: :btree
    t.index ["courseid"], name: "mdl_gradoutchist_cou_ix", using: :btree
    t.index ["loggeduser"], name: "mdl_gradoutchist_log_ix", using: :btree
    t.index ["oldid"], name: "mdl_gradoutchist_old_ix", using: :btree
    t.index ["scaleid"], name: "mdl_gradoutchist_sca_ix", using: :btree
  end

  create_table "mdl_grade_settings", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "gradebook settings" do |t|
    t.bigint "courseid",                                 null: false
    t.string "name",                        default: "", null: false
    t.text   "value",    limit: 4294967295
    t.index ["courseid", "name"], name: "mdl_gradsett_counam_uix", unique: true, using: :btree
    t.index ["courseid"], name: "mdl_gradsett_cou_ix", using: :btree
  end

  create_table "mdl_grading_areas", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Identifies gradable areas where advanced grading can happen." do |t|
    t.bigint "contextid",                             null: false
    t.string "component",    limit: 100, default: "", null: false
    t.string "areaname",     limit: 100, default: "", null: false
    t.string "activemethod", limit: 100
    t.index ["contextid", "component", "areaname"], name: "mdl_gradarea_concomare_uix", unique: true, using: :btree
    t.index ["contextid"], name: "mdl_gradarea_con_ix", using: :btree
  end

  create_table "mdl_grading_definitions", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Contains the basic information about an advanced grading for" do |t|
    t.bigint  "areaid",                                            null: false
    t.string  "method",            limit: 100,        default: "", null: false
    t.string  "name",                                 default: "", null: false
    t.text    "description",       limit: 4294967295
    t.integer "descriptionformat", limit: 1
    t.bigint  "status",                               default: 0,  null: false
    t.bigint  "copiedfromid"
    t.bigint  "timecreated",                                       null: false
    t.bigint  "usercreated",                                       null: false
    t.bigint  "timemodified",                                      null: false
    t.bigint  "usermodified",                                      null: false
    t.bigint  "timecopied",                           default: 0
    t.text    "options",           limit: 4294967295
    t.index ["areaid", "method"], name: "mdl_graddefi_aremet_uix", unique: true, using: :btree
    t.index ["areaid"], name: "mdl_graddefi_are_ix", using: :btree
    t.index ["usercreated"], name: "mdl_graddefi_use2_ix", using: :btree
    t.index ["usermodified"], name: "mdl_graddefi_use_ix", using: :btree
  end

  create_table "mdl_grading_instances", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Grading form instance is an assessment record for one gradab" do |t|
    t.bigint  "definitionid",                                                           null: false
    t.bigint  "raterid",                                                                null: false
    t.bigint  "itemid"
    t.decimal "rawgrade",                          precision: 10, scale: 5
    t.bigint  "status",                                                     default: 0, null: false
    t.text    "feedback",       limit: 4294967295
    t.integer "feedbackformat", limit: 1
    t.bigint  "timemodified",                                                           null: false
    t.index ["definitionid"], name: "mdl_gradinst_def_ix", using: :btree
    t.index ["raterid"], name: "mdl_gradinst_rat_ix", using: :btree
  end

  create_table "mdl_gradingform_guide_comments", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "frequently used comments used in marking guide" do |t|
    t.bigint  "definitionid",                         null: false
    t.bigint  "sortorder",                            null: false
    t.text    "description",       limit: 4294967295
    t.integer "descriptionformat", limit: 1
    t.index ["definitionid"], name: "mdl_gradguidcomm_def_ix", using: :btree
  end

  create_table "mdl_gradingform_guide_criteria", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores the rows of the criteria grid." do |t|
    t.bigint  "definitionid",                                                                      null: false
    t.bigint  "sortorder",                                                                         null: false
    t.string  "shortname",                                                            default: "", null: false
    t.text    "description",              limit: 4294967295
    t.integer "descriptionformat",        limit: 1
    t.text    "descriptionmarkers",       limit: 4294967295
    t.integer "descriptionmarkersformat", limit: 1
    t.decimal "maxscore",                                    precision: 10, scale: 5,              null: false
    t.index ["definitionid"], name: "mdl_gradguidcrit_def_ix", using: :btree
  end

  create_table "mdl_gradingform_guide_fillings", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores the data of how the guide is filled by a particular r" do |t|
    t.bigint  "instanceid",                                               null: false
    t.bigint  "criterionid",                                              null: false
    t.text    "remark",       limit: 4294967295
    t.integer "remarkformat", limit: 1
    t.decimal "score",                           precision: 10, scale: 5, null: false
    t.index ["criterionid"], name: "mdl_gradguidfill_cri_ix", using: :btree
    t.index ["instanceid", "criterionid"], name: "mdl_gradguidfill_inscri_uix", unique: true, using: :btree
    t.index ["instanceid"], name: "mdl_gradguidfill_ins_ix", using: :btree
  end

  create_table "mdl_gradingform_rubric_criteria", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores the rows of the rubric grid." do |t|
    t.bigint  "definitionid",                         null: false
    t.bigint  "sortorder",                            null: false
    t.text    "description",       limit: 4294967295
    t.integer "descriptionformat", limit: 1
    t.index ["definitionid"], name: "mdl_gradrubrcrit_def_ix", using: :btree
  end

  create_table "mdl_gradingform_rubric_fillings", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores the data of how the rubric is filled by a particular " do |t|
    t.bigint  "instanceid",                      null: false
    t.bigint  "criterionid",                     null: false
    t.bigint  "levelid"
    t.text    "remark",       limit: 4294967295
    t.integer "remarkformat", limit: 1
    t.index ["criterionid"], name: "mdl_gradrubrfill_cri_ix", using: :btree
    t.index ["instanceid", "criterionid"], name: "mdl_gradrubrfill_inscri_uix", unique: true, using: :btree
    t.index ["instanceid"], name: "mdl_gradrubrfill_ins_ix", using: :btree
    t.index ["levelid"], name: "mdl_gradrubrfill_lev_ix", using: :btree
  end

  create_table "mdl_gradingform_rubric_levels", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores the columns of the rubric grid." do |t|
    t.bigint  "criterionid",                                                  null: false
    t.decimal "score",                               precision: 10, scale: 5, null: false
    t.text    "definition",       limit: 4294967295
    t.bigint  "definitionformat"
    t.index ["criterionid"], name: "mdl_gradrubrleve_cri_ix", using: :btree
  end

  create_table "mdl_groupings", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "A grouping is a collection of groups. WAS: groups_groupings" do |t|
    t.bigint  "courseid",                             default: 0,  null: false
    t.string  "name",                                 default: "", null: false
    t.string  "idnumber",          limit: 100,        default: "", null: false
    t.text    "description",       limit: 4294967295
    t.integer "descriptionformat", limit: 1,          default: 0,  null: false
    t.text    "configdata",        limit: 4294967295
    t.bigint  "timecreated",                          default: 0,  null: false
    t.bigint  "timemodified",                         default: 0,  null: false
    t.index ["courseid"], name: "mdl_grou_cou2_ix", using: :btree
    t.index ["idnumber"], name: "mdl_grou_idn2_ix", using: :btree
  end

  create_table "mdl_groupings_groups", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Link a grouping to a group (note, groups can be in multiple " do |t|
    t.bigint "groupingid", default: 0, null: false
    t.bigint "groupid",    default: 0, null: false
    t.bigint "timeadded",  default: 0, null: false
    t.index ["groupid"], name: "mdl_grougrou_gro2_ix", using: :btree
    t.index ["groupingid"], name: "mdl_grougrou_gro_ix", using: :btree
  end

  create_table "mdl_groups", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Each record represents a group." do |t|
    t.bigint  "courseid",                                             null: false
    t.string  "idnumber",          limit: 100,        default: "",    null: false
    t.string  "name",              limit: 254,        default: "",    null: false
    t.text    "description",       limit: 4294967295
    t.integer "descriptionformat", limit: 1,          default: 0,     null: false
    t.string  "enrolmentkey",      limit: 50
    t.bigint  "picture",                              default: 0,     null: false
    t.boolean "hidepicture",                          default: false, null: false
    t.bigint  "timecreated",                          default: 0,     null: false
    t.bigint  "timemodified",                         default: 0,     null: false
    t.index ["courseid"], name: "mdl_grou_cou_ix", using: :btree
    t.index ["idnumber"], name: "mdl_grou_idn_ix", using: :btree
  end

  create_table "mdl_groups_members", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Link a user to a group." do |t|
    t.bigint "groupid",               default: 0,  null: false
    t.bigint "userid",                default: 0,  null: false
    t.bigint "timeadded",             default: 0,  null: false
    t.string "component", limit: 100, default: "", null: false
    t.bigint "itemid",                default: 0,  null: false
    t.index ["groupid"], name: "mdl_groumemb_gro_ix", using: :btree
    t.index ["userid"], name: "mdl_groumemb_use_ix", using: :btree
  end

  create_table "mdl_imscp", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "each record is one imscp resource" do |t|
    t.bigint  "course",                          default: 0,  null: false
    t.string  "name",                            default: "", null: false
    t.text    "intro",        limit: 4294967295
    t.integer "introformat",  limit: 2,          default: 0,  null: false
    t.bigint  "revision",                        default: 0,  null: false
    t.bigint  "keepold",                         default: -1, null: false
    t.text    "structure",    limit: 4294967295
    t.bigint  "timemodified",                    default: 0,  null: false
    t.index ["course"], name: "mdl_imsc_cou_ix", using: :btree
  end

  create_table "mdl_label", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Defines labels" do |t|
    t.bigint  "course",                          default: 0,  null: false
    t.string  "name",                            default: "", null: false
    t.text    "intro",        limit: 4294967295,              null: false
    t.integer "introformat",  limit: 2,          default: 0
    t.bigint  "timemodified",                    default: 0,  null: false
    t.index ["course"], name: "mdl_labe_cou_ix", using: :btree
  end

  create_table "mdl_lesson", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Defines lesson" do |t|
    t.bigint  "course",                             default: 0,         null: false
    t.string  "name",                               default: "",        null: false
    t.integer "practice",        limit: 2,          default: 0,         null: false
    t.integer "modattempts",     limit: 2,          default: 0,         null: false
    t.integer "usepassword",     limit: 2,          default: 0,         null: false
    t.string  "password",        limit: 32,         default: "",        null: false
    t.bigint  "dependency",                         default: 0,         null: false
    t.text    "conditions",      limit: 4294967295,                     null: false
    t.bigint  "grade",                              default: 0,         null: false
    t.integer "custom",          limit: 2,          default: 0,         null: false
    t.integer "ongoing",         limit: 2,          default: 0,         null: false
    t.integer "usemaxgrade",     limit: 2,          default: 0,         null: false
    t.integer "maxanswers",      limit: 2,          default: 4,         null: false
    t.integer "maxattempts",     limit: 2,          default: 5,         null: false
    t.integer "review",          limit: 2,          default: 0,         null: false
    t.integer "nextpagedefault", limit: 2,          default: 0,         null: false
    t.integer "feedback",        limit: 2,          default: 1,         null: false
    t.integer "minquestions",    limit: 2,          default: 0,         null: false
    t.integer "maxpages",        limit: 2,          default: 0,         null: false
    t.integer "timed",           limit: 2,          default: 0,         null: false
    t.bigint  "maxtime",                            default: 0,         null: false
    t.integer "retake",          limit: 2,          default: 1,         null: false
    t.bigint  "activitylink",                       default: 0,         null: false
    t.string  "mediafile",                          default: "",        null: false
    t.bigint  "mediaheight",                        default: 100,       null: false
    t.bigint  "mediawidth",                         default: 650,       null: false
    t.integer "mediaclose",      limit: 2,          default: 0,         null: false
    t.integer "slideshow",       limit: 2,          default: 0,         null: false
    t.bigint  "width",                              default: 640,       null: false
    t.bigint  "height",                             default: 480,       null: false
    t.string  "bgcolor",         limit: 7,          default: "#FFFFFF", null: false
    t.integer "displayleft",     limit: 2,          default: 0,         null: false
    t.integer "displayleftif",   limit: 2,          default: 0,         null: false
    t.integer "progressbar",     limit: 2,          default: 0,         null: false
    t.integer "highscores",      limit: 2,          default: 0,         null: false
    t.bigint  "maxhighscores",                      default: 0,         null: false
    t.bigint  "available",                          default: 0,         null: false
    t.bigint  "deadline",                           default: 0,         null: false
    t.bigint  "timemodified",                       default: 0,         null: false
    t.index ["course"], name: "mdl_less_cou_ix", using: :btree
  end

  create_table "mdl_lesson_answers", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Defines lesson_answers" do |t|
    t.bigint  "lessonid",                          default: 0, null: false
    t.bigint  "pageid",                            default: 0, null: false
    t.bigint  "jumpto",                            default: 0, null: false
    t.integer "grade",          limit: 2,          default: 0, null: false
    t.bigint  "score",                             default: 0, null: false
    t.integer "flags",          limit: 2,          default: 0, null: false
    t.bigint  "timecreated",                       default: 0, null: false
    t.bigint  "timemodified",                      default: 0, null: false
    t.text    "answer",         limit: 4294967295
    t.integer "answerformat",   limit: 1,          default: 0, null: false
    t.text    "response",       limit: 4294967295
    t.integer "responseformat", limit: 1,          default: 0, null: false
    t.index ["lessonid"], name: "mdl_lessansw_les_ix", using: :btree
    t.index ["pageid"], name: "mdl_lessansw_pag_ix", using: :btree
  end

  create_table "mdl_lesson_attempts", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Defines lesson_attempts" do |t|
    t.bigint  "lessonid",                      default: 0, null: false
    t.bigint  "pageid",                        default: 0, null: false
    t.bigint  "userid",                        default: 0, null: false
    t.bigint  "answerid",                      default: 0, null: false
    t.integer "retry",      limit: 2,          default: 0, null: false
    t.bigint  "correct",                       default: 0, null: false
    t.text    "useranswer", limit: 4294967295
    t.bigint  "timeseen",                      default: 0, null: false
    t.index ["answerid"], name: "mdl_lessatte_ans_ix", using: :btree
    t.index ["lessonid"], name: "mdl_lessatte_les_ix", using: :btree
    t.index ["pageid"], name: "mdl_lessatte_pag_ix", using: :btree
    t.index ["userid"], name: "mdl_lessatte_use_ix", using: :btree
  end

  create_table "mdl_lesson_branch", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "branches for each lesson/user" do |t|
    t.bigint  "lessonid",           default: 0, null: false
    t.bigint  "userid",             default: 0, null: false
    t.bigint  "pageid",             default: 0, null: false
    t.bigint  "retry",              default: 0, null: false
    t.integer "flag",     limit: 2, default: 0, null: false
    t.bigint  "timeseen",           default: 0, null: false
    t.index ["lessonid"], name: "mdl_lessbran_les_ix", using: :btree
    t.index ["pageid"], name: "mdl_lessbran_pag_ix", using: :btree
    t.index ["userid"], name: "mdl_lessbran_use_ix", using: :btree
  end

  create_table "mdl_lesson_grades", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Defines lesson_grades" do |t|
    t.bigint  "lessonid",             default: 0,   null: false
    t.bigint  "userid",               default: 0,   null: false
    t.float   "grade",     limit: 53, default: 0.0, null: false
    t.integer "late",      limit: 2,  default: 0,   null: false
    t.bigint  "completed",            default: 0,   null: false
    t.index ["lessonid"], name: "mdl_lessgrad_les_ix", using: :btree
    t.index ["userid"], name: "mdl_lessgrad_use_ix", using: :btree
  end

  create_table "mdl_lesson_high_scores", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "high scores for each lesson" do |t|
    t.bigint "lessonid",           default: 0,  null: false
    t.bigint "userid",             default: 0,  null: false
    t.bigint "gradeid",            default: 0,  null: false
    t.string "nickname", limit: 5, default: "", null: false
    t.index ["lessonid"], name: "mdl_lesshighscor_les_ix", using: :btree
    t.index ["userid"], name: "mdl_lesshighscor_use_ix", using: :btree
  end

  create_table "mdl_lesson_pages", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Defines lesson_pages" do |t|
    t.bigint  "lessonid",                          default: 0,  null: false
    t.bigint  "prevpageid",                        default: 0,  null: false
    t.bigint  "nextpageid",                        default: 0,  null: false
    t.integer "qtype",          limit: 2,          default: 0,  null: false
    t.integer "qoption",        limit: 2,          default: 0,  null: false
    t.integer "layout",         limit: 2,          default: 1,  null: false
    t.integer "display",        limit: 2,          default: 1,  null: false
    t.bigint  "timecreated",                       default: 0,  null: false
    t.bigint  "timemodified",                      default: 0,  null: false
    t.string  "title",                             default: "", null: false
    t.text    "contents",       limit: 4294967295,              null: false
    t.integer "contentsformat", limit: 1,          default: 0,  null: false
    t.index ["lessonid"], name: "mdl_lesspage_les_ix", using: :btree
  end

  create_table "mdl_lesson_timer", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "lesson timer for each lesson" do |t|
    t.bigint "lessonid",   default: 0, null: false
    t.bigint "userid",     default: 0, null: false
    t.bigint "starttime",  default: 0, null: false
    t.bigint "lessontime", default: 0, null: false
    t.index ["lessonid"], name: "mdl_lesstime_les_ix", using: :btree
    t.index ["userid"], name: "mdl_lesstime_use_ix", using: :btree
  end

  create_table "mdl_license", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "store licenses used by moodle" do |t|
    t.string  "shortname"
    t.text    "fullname",  limit: 4294967295
    t.string  "source"
    t.boolean "enabled",                      default: true, null: false
    t.bigint  "version",                      default: 0,    null: false
  end

  create_table "mdl_lock_db", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores active and inactive lock types for db locking method." do |t|
    t.string "resourcekey",            default: "", null: false
    t.bigint "expires"
    t.string "owner",       limit: 36
    t.index ["expires"], name: "mdl_lockdb_exp_ix", using: :btree
    t.index ["owner"], name: "mdl_lockdb_own_ix", using: :btree
    t.index ["resourcekey"], name: "mdl_lockdb_res_uix", unique: true, using: :btree
  end

  create_table "mdl_log", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Every action is logged as far as possible" do |t|
    t.bigint "time",               default: 0,  null: false
    t.bigint "userid",             default: 0,  null: false
    t.string "ip",     limit: 45,  default: "", null: false
    t.bigint "course",             default: 0,  null: false
    t.string "module", limit: 20,  default: "", null: false
    t.bigint "cmid",               default: 0,  null: false
    t.string "action", limit: 40,  default: "", null: false
    t.string "url",    limit: 100, default: "", null: false
    t.string "info",               default: "", null: false
    t.index ["action"], name: "mdl_log_act_ix", using: :btree
    t.index ["cmid"], name: "mdl_log_cmi_ix", using: :btree
    t.index ["course", "module", "action"], name: "mdl_log_coumodact_ix", using: :btree
    t.index ["time"], name: "mdl_log_tim_ix", using: :btree
    t.index ["userid", "course"], name: "mdl_log_usecou_ix", using: :btree
  end

  create_table "mdl_log_display", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "For a particular module/action, specifies a moodle table/fie" do |t|
    t.string "module",    limit: 20,  default: "", null: false
    t.string "action",    limit: 40,  default: "", null: false
    t.string "mtable",    limit: 30,  default: "", null: false
    t.string "field",     limit: 200, default: "", null: false
    t.string "component", limit: 100, default: "", null: false
    t.index ["module", "action"], name: "mdl_logdisp_modact_uix", unique: true, using: :btree
  end

  create_table "mdl_log_queries", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Logged database queries." do |t|
    t.integer "qtype",      limit: 3,                                               null: false
    t.text    "sqltext",    limit: 4294967295,                                      null: false
    t.text    "sqlparams",  limit: 4294967295
    t.integer "error",      limit: 3,                                   default: 0, null: false
    t.text    "info",       limit: 4294967295
    t.text    "backtrace",  limit: 4294967295
    t.decimal "exectime",                      precision: 10, scale: 5,             null: false
    t.bigint  "timelogged",                                                         null: false
  end

  create_table "mdl_logstore_standard_log", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Standard log table" do |t|
    t.string  "eventname",                            default: "",    null: false
    t.string  "component",         limit: 100,        default: "",    null: false
    t.string  "action",            limit: 100,        default: "",    null: false
    t.string  "target",            limit: 100,        default: "",    null: false
    t.string  "objecttable",       limit: 50
    t.bigint  "objectid"
    t.string  "crud",              limit: 1,          default: "",    null: false
    t.boolean "edulevel",                                             null: false
    t.bigint  "contextid",                                            null: false
    t.bigint  "contextlevel",                                         null: false
    t.bigint  "contextinstanceid",                                    null: false
    t.bigint  "userid",                                               null: false
    t.bigint  "courseid"
    t.bigint  "relateduserid"
    t.boolean "anonymous",                            default: false, null: false
    t.text    "other",             limit: 4294967295
    t.bigint  "timecreated",                                          null: false
    t.string  "origin",            limit: 10
    t.string  "ip",                limit: 45
    t.bigint  "realuserid"
    t.index ["courseid", "anonymous", "timecreated"], name: "mdl_logsstanlog_couanotim_ix", using: :btree
    t.index ["timecreated"], name: "mdl_logsstanlog_tim_ix", using: :btree
    t.index ["userid", "contextlevel", "contextinstanceid", "crud", "edulevel", "timecreated"], name: "mdl_logsstanlog_useconconcr_ix", using: :btree
  end

  create_table "mdl_lti", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This table contains Basic LTI activities instances" do |t|
    t.bigint  "course",                                                                    default: 0,       null: false
    t.string  "name",                                                                      default: "",      null: false
    t.text    "intro",                         limit: 4294967295
    t.integer "introformat",                   limit: 2,                                   default: 0
    t.bigint  "timecreated",                                                               default: 0,       null: false
    t.bigint  "timemodified",                                                              default: 0,       null: false
    t.bigint  "typeid"
    t.text    "toolurl",                       limit: 4294967295,                                            null: false
    t.text    "securetoolurl",                 limit: 4294967295
    t.boolean "instructorchoicesendname"
    t.boolean "instructorchoicesendemailaddr"
    t.boolean "instructorchoiceallowroster"
    t.boolean "instructorchoiceallowsetting"
    t.string  "instructorcustomparameters"
    t.boolean "instructorchoiceacceptgrades"
    t.decimal "grade",                                            precision: 10, scale: 5, default: "100.0", null: false
    t.integer "launchcontainer",               limit: 1,                                   default: 1,       null: false
    t.string  "resourcekey"
    t.string  "password"
    t.boolean "debuglaunch",                                                               default: false,   null: false
    t.boolean "showtitlelaunch",                                                           default: false,   null: false
    t.boolean "showdescriptionlaunch",                                                     default: false,   null: false
    t.string  "servicesalt",                   limit: 40
    t.text    "icon",                          limit: 4294967295
    t.text    "secureicon",                    limit: 4294967295
    t.index ["course"], name: "mdl_lti_cou_ix", using: :btree
  end

  create_table "mdl_lti_submission", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Keeps track of individual submissions for LTI activities." do |t|
    t.bigint  "ltiid",                                            null: false
    t.bigint  "userid",                                           null: false
    t.bigint  "datesubmitted",                                    null: false
    t.bigint  "dateupdated",                                      null: false
    t.decimal "gradepercent",            precision: 10, scale: 5, null: false
    t.decimal "originalgrade",           precision: 10, scale: 5, null: false
    t.bigint  "launchid",                                         null: false
    t.integer "state",         limit: 1,                          null: false
    t.index ["ltiid"], name: "mdl_ltisubm_lti_ix", using: :btree
  end

  create_table "mdl_lti_types", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Basic LTI pre-configured activities" do |t|
    t.string  "name",                             default: "basiclti Activity", null: false
    t.text    "baseurl",       limit: 4294967295,                               null: false
    t.string  "tooldomain",                       default: "",                  null: false
    t.integer "state",         limit: 1,          default: 2,                   null: false
    t.bigint  "course",                                                         null: false
    t.boolean "coursevisible",                    default: false,               null: false
    t.bigint  "createdby",                                                      null: false
    t.bigint  "timecreated",                                                    null: false
    t.bigint  "timemodified",                                                   null: false
    t.index ["course"], name: "mdl_ltitype_cou_ix", using: :btree
    t.index ["tooldomain"], name: "mdl_ltitype_too_ix", using: :btree
  end

  create_table "mdl_lti_types_config", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Basic LTI types configuration" do |t|
    t.bigint "typeid",                          null: false
    t.string "name",   limit: 100, default: "", null: false
    t.string "value",              default: "", null: false
    t.index ["typeid"], name: "mdl_ltitypeconf_typ_ix", using: :btree
  end

  create_table "mdl_message", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores all unread messages" do |t|
    t.bigint  "useridfrom",                           default: 0,     null: false
    t.bigint  "useridto",                             default: 0,     null: false
    t.text    "subject",           limit: 4294967295
    t.text    "fullmessage",       limit: 4294967295
    t.integer "fullmessageformat", limit: 2,          default: 0
    t.text    "fullmessagehtml",   limit: 4294967295
    t.text    "smallmessage",      limit: 4294967295
    t.boolean "notification",                         default: false
    t.text    "contexturl",        limit: 4294967295
    t.text    "contexturlname",    limit: 4294967295
    t.bigint  "timecreated",                          default: 0,     null: false
    t.index ["useridfrom"], name: "mdl_mess_use_ix", using: :btree
    t.index ["useridto"], name: "mdl_mess_use2_ix", using: :btree
  end

  create_table "mdl_message_airnotifier_devices", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Store information about the devices registered in Airnotifie" do |t|
    t.bigint  "userdeviceid",                null: false
    t.boolean "enable",       default: true, null: false
    t.index ["userdeviceid"], name: "mdl_messairndevi_use_uix", unique: true, using: :btree
  end

  create_table "mdl_message_contacts", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Maintains lists of relationships between users" do |t|
    t.bigint  "userid",    default: 0,     null: false
    t.bigint  "contactid", default: 0,     null: false
    t.boolean "blocked",   default: false, null: false
    t.index ["userid", "contactid"], name: "mdl_messcont_usecon_uix", unique: true, using: :btree
  end

  create_table "mdl_message_processors", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "List of message output plugins" do |t|
    t.string  "name",    limit: 166, default: "",   null: false
    t.boolean "enabled",             default: true, null: false
  end

  create_table "mdl_message_providers", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This table stores the message providers (modules and core sy" do |t|
    t.string "name",       limit: 100, default: "", null: false
    t.string "component",  limit: 200, default: "", null: false
    t.string "capability"
    t.index ["component", "name"], name: "mdl_messprov_comnam_uix", unique: true, using: :btree
  end

  create_table "mdl_message_read", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores all messages that have been read" do |t|
    t.bigint  "useridfrom",                           default: 0,     null: false
    t.bigint  "useridto",                             default: 0,     null: false
    t.text    "subject",           limit: 4294967295
    t.text    "fullmessage",       limit: 4294967295
    t.integer "fullmessageformat", limit: 2,          default: 0
    t.text    "fullmessagehtml",   limit: 4294967295
    t.text    "smallmessage",      limit: 4294967295
    t.boolean "notification",                         default: false
    t.text    "contexturl",        limit: 4294967295
    t.text    "contexturlname",    limit: 4294967295
    t.bigint  "timecreated",                          default: 0,     null: false
    t.bigint  "timeread",                             default: 0,     null: false
    t.index ["useridfrom"], name: "mdl_messread_use_ix", using: :btree
    t.index ["useridto"], name: "mdl_messread_use2_ix", using: :btree
  end

  create_table "mdl_message_working", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Lists all the messages and processors that need to be proces" do |t|
    t.bigint "unreadmessageid", null: false
    t.bigint "processorid",     null: false
    t.index ["unreadmessageid"], name: "mdl_messwork_unr_ix", using: :btree
  end

  create_table "mdl_mnet_application", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Information about applications on remote hosts" do |t|
    t.string "name",              limit: 50, default: "", null: false
    t.string "display_name",      limit: 50, default: "", null: false
    t.string "xmlrpc_server_url",            default: "", null: false
    t.string "sso_land_url",                 default: "", null: false
    t.string "sso_jump_url",                 default: "", null: false
  end

  create_table "mdl_mnet_host", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Information about the local and remote hosts for RPC" do |t|
    t.boolean "deleted",                               default: false, null: false
    t.string  "wwwroot",                               default: "",    null: false
    t.string  "ip_address",         limit: 45,         default: "",    null: false
    t.string  "name",               limit: 80,         default: "",    null: false
    t.text    "public_key",         limit: 4294967295,                 null: false
    t.bigint  "public_key_expires",                    default: 0,     null: false
    t.integer "transport",          limit: 1,          default: 0,     null: false
    t.integer "portno",             limit: 3,          default: 0,     null: false
    t.bigint  "last_connect_time",                     default: 0,     null: false
    t.bigint  "last_log_id",                           default: 0,     null: false
    t.boolean "force_theme",                           default: false, null: false
    t.string  "theme",              limit: 100
    t.bigint  "applicationid",                         default: 1,     null: false
    t.index ["applicationid"], name: "mdl_mnethost_app_ix", using: :btree
  end

  create_table "mdl_mnet_host2service", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Information about the services for a given host" do |t|
    t.bigint  "hostid",    default: 0,     null: false
    t.bigint  "serviceid", default: 0,     null: false
    t.boolean "publish",   default: false, null: false
    t.boolean "subscribe", default: false, null: false
    t.index ["hostid", "serviceid"], name: "mdl_mnethost_hosser_uix", unique: true, using: :btree
  end

  create_table "mdl_mnet_log", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Store session data from users migrating to other sites" do |t|
    t.bigint "hostid",                 default: 0,  null: false
    t.bigint "remoteid",               default: 0,  null: false
    t.bigint "time",                   default: 0,  null: false
    t.bigint "userid",                 default: 0,  null: false
    t.string "ip",         limit: 45,  default: "", null: false
    t.bigint "course",                 default: 0,  null: false
    t.string "coursename", limit: 40,  default: "", null: false
    t.string "module",     limit: 20,  default: "", null: false
    t.bigint "cmid",                   default: 0,  null: false
    t.string "action",     limit: 40,  default: "", null: false
    t.string "url",        limit: 100, default: "", null: false
    t.string "info",                   default: "", null: false
    t.index ["hostid", "userid", "course"], name: "mdl_mnetlog_hosusecou_ix", using: :btree
  end

  create_table "mdl_mnet_remote_rpc", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This table describes functions that might be called remotely" do |t|
    t.string  "functionname", limit: 40, default: "", null: false
    t.string  "xmlrpcpath",   limit: 80, default: "", null: false
    t.string  "plugintype",   limit: 20, default: "", null: false
    t.string  "pluginname",   limit: 20, default: "", null: false
    t.boolean "enabled",                              null: false
  end

  create_table "mdl_mnet_remote_service2rpc", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Group functions or methods under a service" do |t|
    t.bigint "serviceid", default: 0, null: false
    t.bigint "rpcid",     default: 0, null: false
    t.index ["rpcid", "serviceid"], name: "mdl_mnetremoserv_rpcser_uix", unique: true, using: :btree
  end

  create_table "mdl_mnet_rpc", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Functions or methods that we may publish or subscribe to" do |t|
    t.string  "functionname", limit: 40,         default: "",    null: false
    t.string  "xmlrpcpath",   limit: 80,         default: "",    null: false
    t.string  "plugintype",   limit: 20,         default: "",    null: false
    t.string  "pluginname",   limit: 20,         default: "",    null: false
    t.boolean "enabled",                         default: false, null: false
    t.text    "help",         limit: 4294967295,                 null: false
    t.text    "profile",      limit: 4294967295,                 null: false
    t.string  "filename",     limit: 100,        default: "",    null: false
    t.string  "classname",    limit: 150
    t.boolean "static"
    t.index ["enabled", "xmlrpcpath"], name: "mdl_mnetrpc_enaxml_ix", using: :btree
  end

  create_table "mdl_mnet_service", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "A service is a group of functions" do |t|
    t.string  "name",        limit: 40, default: "",    null: false
    t.string  "description", limit: 40, default: "",    null: false
    t.string  "apiversion",  limit: 10, default: "",    null: false
    t.boolean "offer",                  default: false, null: false
  end

  create_table "mdl_mnet_service2rpc", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Group functions or methods under a service" do |t|
    t.bigint "serviceid", default: 0, null: false
    t.bigint "rpcid",     default: 0, null: false
    t.index ["rpcid", "serviceid"], name: "mdl_mnetserv_rpcser_uix", unique: true, using: :btree
  end

  create_table "mdl_mnet_session", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Store session data from users migrating to other sites" do |t|
    t.bigint "userid",                      default: 0,  null: false
    t.string "username",        limit: 100, default: "", null: false
    t.string "token",           limit: 40,  default: "", null: false
    t.bigint "mnethostid",                  default: 0,  null: false
    t.string "useragent",       limit: 40,  default: "", null: false
    t.bigint "confirm_timeout",             default: 0,  null: false
    t.string "session_id",      limit: 40,  default: "", null: false
    t.bigint "expires",                     default: 0,  null: false
    t.index ["token"], name: "mdl_mnetsess_tok_uix", unique: true, using: :btree
  end

  create_table "mdl_mnet_sso_access_control", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Users by host permitted (or not) to login from a remote prov" do |t|
    t.string "username",     limit: 100, default: "",      null: false
    t.bigint "mnet_host_id",             default: 0,       null: false
    t.string "accessctrl",   limit: 20,  default: "allow", null: false
    t.index ["mnet_host_id", "username"], name: "mdl_mnetssoaccecont_mneuse_uix", unique: true, using: :btree
  end

  create_table "mdl_mnetservice_enrol_courses", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Caches the information fetched via XML-RPC about courses on " do |t|
    t.bigint  "hostid",                                        null: false
    t.bigint  "remoteid",                                      null: false
    t.bigint  "categoryid",                                    null: false
    t.string  "categoryname",                     default: "", null: false
    t.bigint  "sortorder",                        default: 0,  null: false
    t.string  "fullname",      limit: 254,        default: "", null: false
    t.string  "shortname",     limit: 100,        default: "", null: false
    t.string  "idnumber",      limit: 100,        default: "", null: false
    t.text    "summary",       limit: 4294967295,              null: false
    t.integer "summaryformat", limit: 2,          default: 0
    t.bigint  "startdate",                                     null: false
    t.bigint  "roleid",                                        null: false
    t.string  "rolename",                         default: "", null: false
    t.index ["hostid", "remoteid"], name: "mdl_mnetenrocour_hosrem_uix", unique: true, using: :btree
  end

  create_table "mdl_mnetservice_enrol_enrolments", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Caches the information about enrolments of our local users i" do |t|
    t.bigint "hostid",                                 null: false
    t.bigint "userid",                                 null: false
    t.bigint "remotecourseid",                         null: false
    t.string "rolename",                  default: "", null: false
    t.bigint "enroltime",                 default: 0,  null: false
    t.string "enroltype",      limit: 20, default: "", null: false
    t.index ["hostid"], name: "mdl_mnetenroenro_hos_ix", using: :btree
    t.index ["userid"], name: "mdl_mnetenroenro_use_ix", using: :btree
  end

  create_table "mdl_modules", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "modules available in the site" do |t|
    t.string  "name",     limit: 20, default: "",   null: false
    t.bigint  "cron",                default: 0,    null: false
    t.bigint  "lastcron",            default: 0,    null: false
    t.string  "search",              default: "",   null: false
    t.boolean "visible",             default: true, null: false
    t.index ["name"], name: "mdl_modu_nam_ix", using: :btree
  end

  create_table "mdl_my_pages", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Extra user pages for the My Moodle system" do |t|
    t.bigint  "userid",                default: 0
    t.string  "name",      limit: 200, default: "",   null: false
    t.boolean "private",               default: true, null: false
    t.integer "sortorder", limit: 3,   default: 0,    null: false
    t.index ["userid", "private"], name: "mdl_mypage_usepri_ix", using: :btree
  end

  create_table "mdl_page", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Each record is one page and its config data" do |t|
    t.bigint  "course",                             default: 0,  null: false
    t.string  "name",                               default: "", null: false
    t.text    "intro",           limit: 4294967295
    t.integer "introformat",     limit: 2,          default: 0,  null: false
    t.text    "content",         limit: 4294967295
    t.integer "contentformat",   limit: 2,          default: 0,  null: false
    t.integer "legacyfiles",     limit: 2,          default: 0,  null: false
    t.bigint  "legacyfileslast"
    t.integer "display",         limit: 2,          default: 0,  null: false
    t.text    "displayoptions",  limit: 4294967295
    t.bigint  "revision",                           default: 0,  null: false
    t.bigint  "timemodified",                       default: 0,  null: false
    t.index ["course"], name: "mdl_page_cou_ix", using: :btree
  end

  create_table "mdl_portfolio_instance", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "base table (not including config data) for instances of port" do |t|
    t.string  "plugin",  limit: 50, default: "",   null: false
    t.string  "name",               default: "",   null: false
    t.boolean "visible",            default: true, null: false
  end

  create_table "mdl_portfolio_instance_config", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "config for portfolio plugin instances" do |t|
    t.bigint "instance",                                 null: false
    t.string "name",                        default: "", null: false
    t.text   "value",    limit: 4294967295
    t.index ["instance"], name: "mdl_portinstconf_ins_ix", using: :btree
    t.index ["name"], name: "mdl_portinstconf_nam_ix", using: :btree
  end

  create_table "mdl_portfolio_instance_user", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "user data for portfolio instances." do |t|
    t.bigint "instance",                                 null: false
    t.bigint "userid",                                   null: false
    t.string "name",                        default: "", null: false
    t.text   "value",    limit: 4294967295
    t.index ["instance"], name: "mdl_portinstuser_ins_ix", using: :btree
    t.index ["userid"], name: "mdl_portinstuser_use_ix", using: :btree
  end

  create_table "mdl_portfolio_log", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "log of portfolio transfers (used to later check for duplicat" do |t|
    t.bigint "userid",                                    null: false
    t.bigint "time",                                      null: false
    t.bigint "portfolio",                                 null: false
    t.string "caller_class",     limit: 150, default: "", null: false
    t.string "caller_file",                  default: "", null: false
    t.string "caller_component"
    t.string "caller_sha1",                  default: "", null: false
    t.bigint "tempdataid",                   default: 0,  null: false
    t.string "returnurl",                    default: "", null: false
    t.string "continueurl",                  default: "", null: false
    t.index ["portfolio"], name: "mdl_portlog_por_ix", using: :btree
    t.index ["userid"], name: "mdl_portlog_use_ix", using: :btree
  end

  create_table "mdl_portfolio_mahara_queue", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "maps mahara tokens to transfer ids" do |t|
    t.bigint "transferid",                         null: false
    t.string "token",      limit: 50, default: "", null: false
    t.index ["token"], name: "mdl_portmahaqueu_tok_ix", using: :btree
    t.index ["transferid"], name: "mdl_portmahaqueu_tra_ix", using: :btree
  end

  create_table "mdl_portfolio_tempdata", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "stores temporary data for portfolio exports. the id of this " do |t|
    t.text    "data",       limit: 4294967295
    t.bigint  "expirytime",                                    null: false
    t.bigint  "userid",                                        null: false
    t.bigint  "instance",                      default: 0
    t.boolean "queued",                        default: false, null: false
    t.index ["instance"], name: "mdl_porttemp_ins_ix", using: :btree
    t.index ["userid"], name: "mdl_porttemp_use_ix", using: :btree
  end

  create_table "mdl_post", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Generic post table to hold data blog entries etc in differen" do |t|
    t.string  "module",         limit: 20,         default: "",      null: false
    t.bigint  "userid",                            default: 0,       null: false
    t.bigint  "courseid",                          default: 0,       null: false
    t.bigint  "groupid",                           default: 0,       null: false
    t.bigint  "moduleid",                          default: 0,       null: false
    t.bigint  "coursemoduleid",                    default: 0,       null: false
    t.string  "subject",        limit: 128,        default: "",      null: false
    t.text    "summary",        limit: 4294967295
    t.text    "content",        limit: 4294967295
    t.string  "uniquehash",                        default: "",      null: false
    t.bigint  "rating",                            default: 0,       null: false
    t.bigint  "format",                            default: 0,       null: false
    t.integer "summaryformat",  limit: 1,          default: 0,       null: false
    t.string  "attachment",     limit: 100
    t.string  "publishstate",   limit: 20,         default: "draft", null: false
    t.bigint  "lastmodified",                      default: 0,       null: false
    t.bigint  "created",                           default: 0,       null: false
    t.bigint  "usermodified"
    t.index ["id", "userid"], name: "mdl_post_iduse_uix", unique: true, using: :btree
    t.index ["lastmodified"], name: "mdl_post_las_ix", using: :btree
    t.index ["module"], name: "mdl_post_mod_ix", using: :btree
    t.index ["subject"], name: "mdl_post_sub_ix", using: :btree
    t.index ["usermodified"], name: "mdl_post_use_ix", using: :btree
  end

  create_table "mdl_profiling", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores the results of all the profiling runs" do |t|
    t.string  "runid",              limit: 32,         default: "", null: false
    t.string  "url",                                   default: "", null: false
    t.text    "data",               limit: 4294967295,              null: false
    t.bigint  "totalexecutiontime",                                 null: false
    t.bigint  "totalcputime",                                       null: false
    t.bigint  "totalcalls",                                         null: false
    t.bigint  "totalmemory",                                        null: false
    t.integer "runreference",       limit: 1,          default: 0,  null: false
    t.string  "runcomment",                            default: "", null: false
    t.bigint  "timecreated",                                        null: false
    t.index ["runid"], name: "mdl_prof_run_uix", unique: true, using: :btree
    t.index ["timecreated", "runreference"], name: "mdl_prof_timrun_ix", using: :btree
    t.index ["url", "runreference"], name: "mdl_prof_urlrun_ix", using: :btree
  end

  create_table "mdl_qtype_essay_options", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Extra options for essay questions." do |t|
    t.bigint  "questionid",                                                   null: false
    t.string  "responseformat",         limit: 16,         default: "editor", null: false
    t.integer "responserequired",       limit: 1,          default: 1,        null: false
    t.integer "responsefieldlines",     limit: 2,          default: 15,       null: false
    t.integer "attachments",            limit: 2,          default: 0,        null: false
    t.integer "attachmentsrequired",    limit: 2,          default: 0,        null: false
    t.text    "graderinfo",             limit: 4294967295
    t.integer "graderinfoformat",       limit: 2,          default: 0,        null: false
    t.text    "responsetemplate",       limit: 4294967295
    t.integer "responsetemplateformat", limit: 2,          default: 0,        null: false
    t.index ["questionid"], name: "mdl_qtypessaopti_que_uix", unique: true, using: :btree
  end

  create_table "mdl_qtype_match_options", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Defines the question-type specific options for matching ques" do |t|
    t.bigint  "questionid",                                        default: 0, null: false
    t.integer "shuffleanswers",                 limit: 2,          default: 1, null: false
    t.text    "correctfeedback",                limit: 4294967295,             null: false
    t.integer "correctfeedbackformat",          limit: 1,          default: 0, null: false
    t.text    "partiallycorrectfeedback",       limit: 4294967295,             null: false
    t.integer "partiallycorrectfeedbackformat", limit: 1,          default: 0, null: false
    t.text    "incorrectfeedback",              limit: 4294967295,             null: false
    t.integer "incorrectfeedbackformat",        limit: 1,          default: 0, null: false
    t.integer "shownumcorrect",                 limit: 1,          default: 0, null: false
    t.index ["questionid"], name: "mdl_qtypmatcopti_que_uix", unique: true, using: :btree
  end

  create_table "mdl_qtype_match_subquestions", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "The subquestions that make up a matching question" do |t|
    t.bigint  "questionid",                            default: 0,  null: false
    t.text    "questiontext",       limit: 4294967295,              null: false
    t.integer "questiontextformat", limit: 1,          default: 0,  null: false
    t.string  "answertext",                            default: "", null: false
    t.index ["questionid"], name: "mdl_qtypmatcsubq_que_ix", using: :btree
  end

  create_table "mdl_qtype_multichoice_options", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Options for multiple choice questions" do |t|
    t.bigint  "questionid",                                        default: 0,     null: false
    t.integer "layout",                         limit: 2,          default: 0,     null: false
    t.integer "single",                         limit: 2,          default: 0,     null: false
    t.integer "shuffleanswers",                 limit: 2,          default: 1,     null: false
    t.text    "correctfeedback",                limit: 4294967295,                 null: false
    t.integer "correctfeedbackformat",          limit: 1,          default: 0,     null: false
    t.text    "partiallycorrectfeedback",       limit: 4294967295,                 null: false
    t.integer "partiallycorrectfeedbackformat", limit: 1,          default: 0,     null: false
    t.text    "incorrectfeedback",              limit: 4294967295,                 null: false
    t.integer "incorrectfeedbackformat",        limit: 1,          default: 0,     null: false
    t.string  "answernumbering",                limit: 10,         default: "abc", null: false
    t.integer "shownumcorrect",                 limit: 1,          default: 0,     null: false
    t.index ["questionid"], name: "mdl_qtypmultopti_que_uix", unique: true, using: :btree
  end

  create_table "mdl_qtype_randomsamatch_options", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Info about a random short-answer matching question" do |t|
    t.bigint  "questionid",                                        default: 0, null: false
    t.bigint  "choose",                                            default: 4, null: false
    t.integer "subcats",                        limit: 1,          default: 1, null: false
    t.text    "correctfeedback",                limit: 4294967295,             null: false
    t.integer "correctfeedbackformat",          limit: 1,          default: 0, null: false
    t.text    "partiallycorrectfeedback",       limit: 4294967295,             null: false
    t.integer "partiallycorrectfeedbackformat", limit: 1,          default: 0, null: false
    t.text    "incorrectfeedback",              limit: 4294967295,             null: false
    t.integer "incorrectfeedbackformat",        limit: 1,          default: 0, null: false
    t.integer "shownumcorrect",                 limit: 1,          default: 0, null: false
    t.index ["questionid"], name: "mdl_qtyprandopti_que_uix", unique: true, using: :btree
  end

  create_table "mdl_qtype_shortanswer_options", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Options for short answer questions" do |t|
    t.bigint  "questionid",           default: 0, null: false
    t.integer "usecase",    limit: 1, default: 0, null: false
    t.index ["questionid"], name: "mdl_qtypshoropti_que_uix", unique: true, using: :btree
  end

  create_table "mdl_question", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "The questions themselves" do |t|
    t.bigint  "category",                                                          default: 0,           null: false
    t.bigint  "parent",                                                            default: 0,           null: false
    t.string  "name",                                                              default: "",          null: false
    t.text    "questiontext",          limit: 4294967295,                                                null: false
    t.integer "questiontextformat",    limit: 1,                                   default: 0,           null: false
    t.text    "generalfeedback",       limit: 4294967295,                                                null: false
    t.integer "generalfeedbackformat", limit: 1,                                   default: 0,           null: false
    t.decimal "defaultmark",                              precision: 12, scale: 7, default: "1.0",       null: false
    t.decimal "penalty",                                  precision: 12, scale: 7, default: "0.3333333", null: false
    t.string  "qtype",                 limit: 20,                                  default: "",          null: false
    t.bigint  "length",                                                            default: 1,           null: false
    t.string  "stamp",                                                             default: "",          null: false
    t.string  "version",                                                           default: "",          null: false
    t.boolean "hidden",                                                            default: false,       null: false
    t.bigint  "timecreated",                                                       default: 0,           null: false
    t.bigint  "timemodified",                                                      default: 0,           null: false
    t.bigint  "createdby"
    t.bigint  "modifiedby"
    t.index ["category"], name: "mdl_ques_cat_ix", using: :btree
    t.index ["createdby"], name: "mdl_ques_cre_ix", using: :btree
    t.index ["modifiedby"], name: "mdl_ques_mod_ix", using: :btree
    t.index ["parent"], name: "mdl_ques_par_ix", using: :btree
  end

  create_table "mdl_question_answers", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Answers, with a fractional grade (0-1) and feedback" do |t|
    t.bigint  "question",                                                   default: 0,     null: false
    t.text    "answer",         limit: 4294967295,                                          null: false
    t.integer "answerformat",   limit: 1,                                   default: 0,     null: false
    t.decimal "fraction",                          precision: 12, scale: 7, default: "0.0", null: false
    t.text    "feedback",       limit: 4294967295,                                          null: false
    t.integer "feedbackformat", limit: 1,                                   default: 0,     null: false
    t.index ["question"], name: "mdl_quesansw_que_ix", using: :btree
  end

  create_table "mdl_question_attempt_step_data", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Each question_attempt_step has an associative array of the d" do |t|
    t.bigint "attemptstepid",                                 null: false
    t.string "name",          limit: 32,         default: "", null: false
    t.text   "value",         limit: 4294967295
    t.index ["attemptstepid", "name"], name: "mdl_quesattestepdata_attna_uix", unique: true, using: :btree
    t.index ["attemptstepid"], name: "mdl_quesattestepdata_att_ix", using: :btree
  end

  create_table "mdl_question_attempt_steps", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores one step in in a question attempt. As well as the dat" do |t|
    t.bigint  "questionattemptid",                                                  null: false
    t.bigint  "sequencenumber",                                                     null: false
    t.string  "state",             limit: 13,                          default: "", null: false
    t.decimal "fraction",                     precision: 12, scale: 7
    t.bigint  "timecreated",                                                        null: false
    t.bigint  "userid"
    t.index ["questionattemptid", "sequencenumber"], name: "mdl_quesattestep_queseq_uix", unique: true, using: :btree
    t.index ["questionattemptid"], name: "mdl_quesattestep_que_ix", using: :btree
    t.index ["userid"], name: "mdl_quesattestep_use_ix", using: :btree
  end

  create_table "mdl_question_attempts", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Each row here corresponds to an attempt at one question, as " do |t|
    t.bigint  "questionusageid",                                                             null: false
    t.bigint  "slot",                                                                        null: false
    t.string  "behaviour",       limit: 32,                                  default: "",    null: false
    t.bigint  "questionid",                                                                  null: false
    t.bigint  "variant",                                                     default: 1,     null: false
    t.decimal "maxmark",                            precision: 12, scale: 7,                 null: false
    t.decimal "minfraction",                        precision: 12, scale: 7,                 null: false
    t.decimal "maxfraction",                        precision: 12, scale: 7, default: "1.0", null: false
    t.boolean "flagged",                                                     default: false, null: false
    t.text    "questionsummary", limit: 4294967295
    t.text    "rightanswer",     limit: 4294967295
    t.text    "responsesummary", limit: 4294967295
    t.bigint  "timemodified",                                                                null: false
    t.index ["behaviour"], name: "mdl_quesatte_beh_ix", using: :btree
    t.index ["questionid"], name: "mdl_quesatte_que_ix", using: :btree
    t.index ["questionusageid", "slot"], name: "mdl_quesatte_queslo_uix", unique: true, using: :btree
    t.index ["questionusageid"], name: "mdl_quesatte_que2_ix", using: :btree
  end

  create_table "mdl_question_calculated", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Options for questions of type calculated" do |t|
    t.bigint "question",                       default: 0,     null: false
    t.bigint "answer",                         default: 0,     null: false
    t.string "tolerance",           limit: 20, default: "0.0", null: false
    t.bigint "tolerancetype",                  default: 1,     null: false
    t.bigint "correctanswerlength",            default: 2,     null: false
    t.bigint "correctanswerformat",            default: 2,     null: false
    t.index ["answer"], name: "mdl_quescalc_ans_ix", using: :btree
    t.index ["question"], name: "mdl_quescalc_que_ix", using: :btree
  end

  create_table "mdl_question_calculated_options", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Options for questions of type calculated" do |t|
    t.bigint  "question",                                          default: 0,     null: false
    t.integer "synchronize",                    limit: 1,          default: 0,     null: false
    t.integer "single",                         limit: 2,          default: 0,     null: false
    t.integer "shuffleanswers",                 limit: 2,          default: 0,     null: false
    t.text    "correctfeedback",                limit: 4294967295
    t.integer "correctfeedbackformat",          limit: 1,          default: 0,     null: false
    t.text    "partiallycorrectfeedback",       limit: 4294967295
    t.integer "partiallycorrectfeedbackformat", limit: 1,          default: 0,     null: false
    t.text    "incorrectfeedback",              limit: 4294967295
    t.integer "incorrectfeedbackformat",        limit: 1,          default: 0,     null: false
    t.string  "answernumbering",                limit: 10,         default: "abc", null: false
    t.integer "shownumcorrect",                 limit: 1,          default: 0,     null: false
    t.index ["question"], name: "mdl_quescalcopti_que_ix", using: :btree
  end

  create_table "mdl_question_categories", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Categories are for grouping questions" do |t|
    t.string  "name",                          default: "",  null: false
    t.bigint  "contextid",                     default: 0,   null: false
    t.text    "info",       limit: 4294967295,               null: false
    t.integer "infoformat", limit: 1,          default: 0,   null: false
    t.string  "stamp",                         default: "",  null: false
    t.bigint  "parent",                        default: 0,   null: false
    t.bigint  "sortorder",                     default: 999, null: false
    t.index ["contextid"], name: "mdl_quescate_con_ix", using: :btree
    t.index ["parent"], name: "mdl_quescate_par_ix", using: :btree
  end

  create_table "mdl_question_dataset_definitions", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Organises and stores properties for dataset items" do |t|
    t.bigint "category",  default: 0,  null: false
    t.string "name",      default: "", null: false
    t.bigint "type",      default: 0,  null: false
    t.string "options",   default: "", null: false
    t.bigint "itemcount", default: 0,  null: false
    t.index ["category"], name: "mdl_quesdatadefi_cat_ix", using: :btree
  end

  create_table "mdl_question_dataset_items", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Individual dataset items" do |t|
    t.bigint "definition", default: 0,  null: false
    t.bigint "itemnumber", default: 0,  null: false
    t.string "value",      default: "", null: false
    t.index ["definition"], name: "mdl_quesdataitem_def_ix", using: :btree
  end

  create_table "mdl_question_datasets", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Many-many relation between questions and dataset definitions" do |t|
    t.bigint "question",          default: 0, null: false
    t.bigint "datasetdefinition", default: 0, null: false
    t.index ["datasetdefinition"], name: "mdl_quesdata_dat_ix", using: :btree
    t.index ["question", "datasetdefinition"], name: "mdl_quesdata_quedat_ix", using: :btree
    t.index ["question"], name: "mdl_quesdata_que_ix", using: :btree
  end

  create_table "mdl_question_hints", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores the the part of the question definition that gives di" do |t|
    t.bigint  "questionid",                                    null: false
    t.text    "hint",           limit: 4294967295,             null: false
    t.integer "hintformat",     limit: 2,          default: 0, null: false
    t.boolean "shownumcorrect"
    t.boolean "clearwrong"
    t.string  "options"
    t.index ["questionid"], name: "mdl_queshint_que_ix", using: :btree
  end

  create_table "mdl_question_multianswer", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Options for multianswer questions" do |t|
    t.bigint "question",                    default: 0, null: false
    t.text   "sequence", limit: 4294967295,             null: false
    t.index ["question"], name: "mdl_quesmult_que_ix", using: :btree
  end

  create_table "mdl_question_numerical", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Options for numerical questions." do |t|
    t.bigint "question",  default: 0,     null: false
    t.bigint "answer",    default: 0,     null: false
    t.string "tolerance", default: "0.0", null: false
    t.index ["answer"], name: "mdl_quesnume_ans_ix", using: :btree
    t.index ["question"], name: "mdl_quesnume_que_ix", using: :btree
  end

  create_table "mdl_question_numerical_options", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Options for questions of type numerical This table is also u" do |t|
    t.bigint  "question",                                           default: 0,     null: false
    t.integer "showunits",       limit: 2,                          default: 0,     null: false
    t.integer "unitsleft",       limit: 2,                          default: 0,     null: false
    t.integer "unitgradingtype", limit: 2,                          default: 0,     null: false
    t.decimal "unitpenalty",               precision: 12, scale: 7, default: "0.1", null: false
    t.index ["question"], name: "mdl_quesnumeopti_que_ix", using: :btree
  end

  create_table "mdl_question_numerical_units", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Optional unit options for numerical questions. This table is" do |t|
    t.bigint  "question",                                        default: 0,     null: false
    t.decimal "multiplier",            precision: 40, scale: 20, default: "1.0", null: false
    t.string  "unit",       limit: 50,                           default: "",    null: false
    t.index ["question", "unit"], name: "mdl_quesnumeunit_queuni_uix", unique: true, using: :btree
    t.index ["question"], name: "mdl_quesnumeunit_que_ix", using: :btree
  end

  create_table "mdl_question_response_analysis", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Analysis of student responses given to questions." do |t|
    t.string  "hashcode",     limit: 40,                                  default: "", null: false
    t.string  "whichtries",                                               default: "", null: false
    t.bigint  "timemodified",                                                          null: false
    t.bigint  "questionid",                                                            null: false
    t.bigint  "variant"
    t.string  "subqid",       limit: 100,                                 default: "", null: false
    t.string  "aid",          limit: 100
    t.text    "response",     limit: 4294967295
    t.decimal "credit",                          precision: 15, scale: 5,              null: false
  end

  create_table "mdl_question_response_count", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Count for each responses for each try at a question." do |t|
    t.bigint "analysisid", null: false
    t.bigint "try",        null: false
    t.bigint "rcount",     null: false
    t.index ["analysisid"], name: "mdl_quesrespcoun_ana_ix", using: :btree
  end

  create_table "mdl_question_statistics", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Statistics for individual questions used in an activity." do |t|
    t.string  "hashcode",                 limit: 40,                                   default: "", null: false
    t.bigint  "timemodified",                                                                       null: false
    t.bigint  "questionid",                                                                         null: false
    t.bigint  "slot"
    t.integer "subquestion",              limit: 2,                                                 null: false
    t.bigint  "variant"
    t.bigint  "s",                                                                     default: 0,  null: false
    t.decimal "effectiveweight",                             precision: 15, scale: 5
    t.integer "negcovar",                 limit: 1,                                    default: 0,  null: false
    t.decimal "discriminationindex",                         precision: 15, scale: 5
    t.decimal "discriminativeefficiency",                    precision: 15, scale: 5
    t.decimal "sd",                                          precision: 15, scale: 10
    t.decimal "facility",                                    precision: 15, scale: 10
    t.text    "subquestions",             limit: 4294967295
    t.decimal "maxmark",                                     precision: 12, scale: 7
    t.text    "positions",                limit: 4294967295
    t.decimal "randomguessscore",                            precision: 12, scale: 7
  end

  create_table "mdl_question_truefalse", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Options for True-False questions" do |t|
    t.bigint "question",    default: 0, null: false
    t.bigint "trueanswer",  default: 0, null: false
    t.bigint "falseanswer", default: 0, null: false
    t.index ["question"], name: "mdl_questrue_que_ix", using: :btree
  end

  create_table "mdl_question_usages", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This table's main purpose it to assign a unique id to each a" do |t|
    t.bigint "contextid",                                  null: false
    t.string "component",                     default: "", null: false
    t.string "preferredbehaviour", limit: 32, default: "", null: false
    t.index ["contextid"], name: "mdl_quesusag_con_ix", using: :btree
  end

  create_table "mdl_quiz", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "The settings for each quiz." do |t|
    t.bigint  "course",                                                             default: 0,             null: false
    t.string  "name",                                                               default: "",            null: false
    t.text    "intro",                  limit: 4294967295,                                                  null: false
    t.integer "introformat",            limit: 2,                                   default: 0,             null: false
    t.bigint  "timeopen",                                                           default: 0,             null: false
    t.bigint  "timeclose",                                                          default: 0,             null: false
    t.bigint  "timelimit",                                                          default: 0,             null: false
    t.string  "overduehandling",        limit: 16,                                  default: "autoabandon", null: false
    t.bigint  "graceperiod",                                                        default: 0,             null: false
    t.string  "preferredbehaviour",     limit: 32,                                  default: "",            null: false
    t.integer "attempts",               limit: 3,                                   default: 0,             null: false
    t.integer "attemptonlast",          limit: 2,                                   default: 0,             null: false
    t.integer "grademethod",            limit: 2,                                   default: 1,             null: false
    t.integer "decimalpoints",          limit: 2,                                   default: 2,             null: false
    t.integer "questiondecimalpoints",  limit: 2,                                   default: -1,            null: false
    t.integer "reviewattempt",          limit: 3,                                   default: 0,             null: false
    t.integer "reviewcorrectness",      limit: 3,                                   default: 0,             null: false
    t.integer "reviewmarks",            limit: 3,                                   default: 0,             null: false
    t.integer "reviewspecificfeedback", limit: 3,                                   default: 0,             null: false
    t.integer "reviewgeneralfeedback",  limit: 3,                                   default: 0,             null: false
    t.integer "reviewrightanswer",      limit: 3,                                   default: 0,             null: false
    t.integer "reviewoverallfeedback",  limit: 3,                                   default: 0,             null: false
    t.bigint  "questionsperpage",                                                   default: 0,             null: false
    t.string  "navmethod",              limit: 16,                                  default: "free",        null: false
    t.integer "shufflequestions",       limit: 2,                                   default: 0,             null: false
    t.integer "shuffleanswers",         limit: 2,                                   default: 0,             null: false
    t.decimal "sumgrades",                                 precision: 10, scale: 5, default: "0.0",         null: false
    t.decimal "grade",                                     precision: 10, scale: 5, default: "0.0",         null: false
    t.bigint  "timecreated",                                                        default: 0,             null: false
    t.bigint  "timemodified",                                                       default: 0,             null: false
    t.string  "password",                                                           default: "",            null: false
    t.string  "subnet",                                                             default: "",            null: false
    t.string  "browsersecurity",        limit: 32,                                  default: "",            null: false
    t.bigint  "delay1",                                                             default: 0,             null: false
    t.bigint  "delay2",                                                             default: 0,             null: false
    t.integer "showuserpicture",        limit: 2,                                   default: 0,             null: false
    t.integer "showblocks",             limit: 2,                                   default: 0,             null: false
    t.index ["course"], name: "mdl_quiz_cou_ix", using: :btree
  end

  create_table "mdl_quiz_attempts", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores users attempts at quizzes." do |t|
    t.bigint  "quiz",                                                       default: 0,            null: false
    t.bigint  "userid",                                                     default: 0,            null: false
    t.integer "attempt",        limit: 3,                                   default: 0,            null: false
    t.bigint  "uniqueid",                                                   default: 0,            null: false
    t.text    "layout",         limit: 4294967295,                                                 null: false
    t.bigint  "currentpage",                                                default: 0,            null: false
    t.integer "preview",        limit: 2,                                   default: 0,            null: false
    t.string  "state",          limit: 16,                                  default: "inprogress", null: false
    t.bigint  "timestart",                                                  default: 0,            null: false
    t.bigint  "timefinish",                                                 default: 0,            null: false
    t.bigint  "timemodified",                                               default: 0,            null: false
    t.bigint  "timecheckstate",                                             default: 0
    t.decimal "sumgrades",                         precision: 10, scale: 5
    t.index ["quiz", "userid", "attempt"], name: "mdl_quizatte_quiuseatt_uix", unique: true, using: :btree
    t.index ["quiz"], name: "mdl_quizatte_qui_ix", using: :btree
    t.index ["state", "timecheckstate"], name: "mdl_quizatte_statim_ix", using: :btree
    t.index ["uniqueid"], name: "mdl_quizatte_uni_uix", unique: true, using: :btree
    t.index ["userid"], name: "mdl_quizatte_use_ix", using: :btree
  end

  create_table "mdl_quiz_feedback", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Feedback given to students based on which grade band their o" do |t|
    t.bigint  "quizid",                                                         default: 0,     null: false
    t.text    "feedbacktext",       limit: 4294967295,                                          null: false
    t.integer "feedbacktextformat", limit: 1,                                   default: 0,     null: false
    t.decimal "mingrade",                              precision: 10, scale: 5, default: "0.0", null: false
    t.decimal "maxgrade",                              precision: 10, scale: 5, default: "0.0", null: false
    t.index ["quizid"], name: "mdl_quizfeed_qui_ix", using: :btree
  end

  create_table "mdl_quiz_grades", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores the overall grade for each user on the quiz, based on" do |t|
    t.bigint  "quiz",                                  default: 0,     null: false
    t.bigint  "userid",                                default: 0,     null: false
    t.decimal "grade",        precision: 10, scale: 5, default: "0.0", null: false
    t.bigint  "timemodified",                          default: 0,     null: false
    t.index ["quiz"], name: "mdl_quizgrad_qui_ix", using: :btree
    t.index ["userid"], name: "mdl_quizgrad_use_ix", using: :btree
  end

  create_table "mdl_quiz_overrides", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "The overrides to quiz settings on a per-user and per-group b" do |t|
    t.bigint  "quiz",                default: 0, null: false
    t.bigint  "groupid"
    t.bigint  "userid"
    t.bigint  "timeopen"
    t.bigint  "timeclose"
    t.bigint  "timelimit"
    t.integer "attempts",  limit: 3
    t.string  "password"
    t.index ["groupid"], name: "mdl_quizover_gro_ix", using: :btree
    t.index ["quiz"], name: "mdl_quizover_qui_ix", using: :btree
    t.index ["userid"], name: "mdl_quizover_use_ix", using: :btree
  end

  create_table "mdl_quiz_overview_regrades", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This table records which question attempts need regrading an" do |t|
    t.bigint  "questionusageid",                                    null: false
    t.bigint  "slot",                                               null: false
    t.decimal "newfraction",               precision: 12, scale: 7
    t.decimal "oldfraction",               precision: 12, scale: 7
    t.integer "regraded",        limit: 2,                          null: false
    t.bigint  "timemodified",                                       null: false
  end

  create_table "mdl_quiz_reports", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Lists all the installed quiz reports and their display order" do |t|
    t.string "name"
    t.bigint "displayorder", null: false
    t.string "capability"
    t.index ["name"], name: "mdl_quizrepo_nam_uix", unique: true, using: :btree
  end

  create_table "mdl_quiz_slots", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores the question used in a quiz, with the order, and for " do |t|
    t.bigint  "slot",                                                null: false
    t.bigint  "quizid",                              default: 0,     null: false
    t.bigint  "page",                                                null: false
    t.bigint  "questionid",                          default: 0,     null: false
    t.decimal "maxmark",    precision: 12, scale: 7, default: "0.0", null: false
    t.index ["questionid"], name: "mdl_quizslot_que_ix", using: :btree
    t.index ["quizid", "slot"], name: "mdl_quizslot_quislo_uix", unique: true, using: :btree
    t.index ["quizid"], name: "mdl_quizslot_qui_ix", using: :btree
  end

  create_table "mdl_quiz_statistics", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "table to cache results from analysis done in statistics repo" do |t|
    t.string  "hashcode",             limit: 40,                           default: "", null: false
    t.integer "whichattempts",        limit: 2,                                         null: false
    t.bigint  "timemodified",                                                           null: false
    t.bigint  "firstattemptscount",                                                     null: false
    t.bigint  "highestattemptscount",                                                   null: false
    t.bigint  "lastattemptscount",                                                      null: false
    t.bigint  "allattemptscount",                                                       null: false
    t.decimal "firstattemptsavg",                precision: 15, scale: 5
    t.decimal "highestattemptsavg",              precision: 15, scale: 5
    t.decimal "lastattemptsavg",                 precision: 15, scale: 5
    t.decimal "allattemptsavg",                  precision: 15, scale: 5
    t.decimal "median",                          precision: 15, scale: 5
    t.decimal "standarddeviation",               precision: 15, scale: 5
    t.decimal "skewness",                        precision: 15, scale: 10
    t.decimal "kurtosis",                        precision: 15, scale: 5
    t.decimal "cic",                             precision: 15, scale: 10
    t.decimal "errorratio",                      precision: 15, scale: 10
    t.decimal "standarderror",                   precision: 15, scale: 10
  end

  create_table "mdl_rating", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "moodle ratings" do |t|
    t.bigint "contextid",                             null: false
    t.string "component",    limit: 100, default: "", null: false
    t.string "ratingarea",   limit: 50,  default: "", null: false
    t.bigint "itemid",                                null: false
    t.bigint "scaleid",                               null: false
    t.bigint "rating",                                null: false
    t.bigint "userid",                                null: false
    t.bigint "timecreated",                           null: false
    t.bigint "timemodified",                          null: false
    t.index ["component", "ratingarea", "contextid", "itemid"], name: "mdl_rati_comratconite_ix", using: :btree
    t.index ["contextid"], name: "mdl_rati_con_ix", using: :btree
    t.index ["userid"], name: "mdl_rati_use_ix", using: :btree
  end

  create_table "mdl_registration_hubs", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "hub where the site is registered on with their associated to" do |t|
    t.string  "token",     default: "",    null: false
    t.string  "hubname",   default: "",    null: false
    t.string  "huburl",    default: "",    null: false
    t.boolean "confirmed", default: false, null: false
    t.string  "secret"
  end

  create_table "mdl_repository", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This table contains one entry for every configured external " do |t|
    t.string  "type",      default: "",   null: false
    t.boolean "visible",   default: true
    t.bigint  "sortorder", default: 0,    null: false
  end

  create_table "mdl_repository_instance_config", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "The config for intances" do |t|
    t.bigint "instanceid",                                 null: false
    t.string "name",                          default: "", null: false
    t.text   "value",      limit: 4294967295
  end

  create_table "mdl_repository_instances", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This table contains one entry for every configured external " do |t|
    t.string  "name",         default: "",    null: false
    t.bigint  "typeid",                       null: false
    t.bigint  "userid",       default: 0,     null: false
    t.bigint  "contextid",                    null: false
    t.string  "username"
    t.string  "password"
    t.bigint  "timecreated"
    t.bigint  "timemodified"
    t.boolean "readonly",     default: false, null: false
  end

  create_table "mdl_resource", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Each record is one resource and its config data" do |t|
    t.bigint  "course",                             default: 0,  null: false
    t.string  "name",                               default: "", null: false
    t.text    "intro",           limit: 4294967295
    t.integer "introformat",     limit: 2,          default: 0,  null: false
    t.integer "tobemigrated",    limit: 2,          default: 0,  null: false
    t.integer "legacyfiles",     limit: 2,          default: 0,  null: false
    t.bigint  "legacyfileslast"
    t.integer "display",         limit: 2,          default: 0,  null: false
    t.text    "displayoptions",  limit: 4294967295
    t.integer "filterfiles",     limit: 2,          default: 0,  null: false
    t.bigint  "revision",                           default: 0,  null: false
    t.bigint  "timemodified",                       default: 0,  null: false
    t.index ["course"], name: "mdl_reso_cou_ix", using: :btree
  end

  create_table "mdl_resource_old", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "backup of all old resource instances from 1.9" do |t|
    t.bigint  "course",                          default: 0,  null: false
    t.string  "name",                            default: "", null: false
    t.string  "type",         limit: 30,         default: "", null: false
    t.string  "reference",                       default: "", null: false
    t.text    "intro",        limit: 4294967295
    t.integer "introformat",  limit: 2,          default: 0,  null: false
    t.text    "alltext",      limit: 4294967295,              null: false
    t.text    "popup",        limit: 4294967295,              null: false
    t.string  "options",                         default: "", null: false
    t.bigint  "timemodified",                    default: 0,  null: false
    t.bigint  "oldid",                                        null: false
    t.bigint  "cmid"
    t.string  "newmodule",    limit: 50
    t.bigint  "newid"
    t.bigint  "migrated",                        default: 0,  null: false
    t.index ["cmid"], name: "mdl_resoold_cmi_ix", using: :btree
    t.index ["oldid"], name: "mdl_resoold_old_uix", unique: true, using: :btree
  end

  create_table "mdl_role", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "moodle roles" do |t|
    t.string "name",                           default: "", null: false
    t.string "shortname",   limit: 100,        default: "", null: false
    t.text   "description", limit: 4294967295,              null: false
    t.bigint "sortorder",                      default: 0,  null: false
    t.string "archetype",   limit: 30,         default: "", null: false
    t.index ["shortname"], name: "mdl_role_sho_uix", unique: true, using: :btree
    t.index ["sortorder"], name: "mdl_role_sor_uix", unique: true, using: :btree
  end

  create_table "mdl_role_allow_assign", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "this defines what role can assign what role" do |t|
    t.bigint "roleid",      default: 0, null: false
    t.bigint "allowassign", default: 0, null: false
    t.index ["allowassign"], name: "mdl_rolealloassi_all_ix", using: :btree
    t.index ["roleid", "allowassign"], name: "mdl_rolealloassi_rolall_uix", unique: true, using: :btree
    t.index ["roleid"], name: "mdl_rolealloassi_rol_ix", using: :btree
  end

  create_table "mdl_role_allow_override", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "this defines what role can override what role" do |t|
    t.bigint "roleid",        default: 0, null: false
    t.bigint "allowoverride", default: 0, null: false
    t.index ["allowoverride"], name: "mdl_rolealloover_all_ix", using: :btree
    t.index ["roleid", "allowoverride"], name: "mdl_rolealloover_rolall_uix", unique: true, using: :btree
    t.index ["roleid"], name: "mdl_rolealloover_rol_ix", using: :btree
  end

  create_table "mdl_role_allow_switch", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This table stores which which other roles a user is allowed " do |t|
    t.bigint "roleid",      null: false
    t.bigint "allowswitch", null: false
    t.index ["allowswitch"], name: "mdl_rolealloswit_all_ix", using: :btree
    t.index ["roleid", "allowswitch"], name: "mdl_rolealloswit_rolall_uix", unique: true, using: :btree
    t.index ["roleid"], name: "mdl_rolealloswit_rol_ix", using: :btree
  end

  create_table "mdl_role_assignments", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "assigning roles in different context" do |t|
    t.bigint "roleid",                   default: 0,  null: false
    t.bigint "contextid",                default: 0,  null: false
    t.bigint "userid",                   default: 0,  null: false
    t.bigint "timemodified",             default: 0,  null: false
    t.bigint "modifierid",               default: 0,  null: false
    t.string "component",    limit: 100, default: "", null: false
    t.bigint "itemid",                   default: 0,  null: false
    t.bigint "sortorder",                default: 0,  null: false
    t.index ["component", "itemid", "userid"], name: "mdl_roleassi_comiteuse_ix", using: :btree
    t.index ["contextid"], name: "mdl_roleassi_con_ix", using: :btree
    t.index ["roleid", "contextid"], name: "mdl_roleassi_rolcon_ix", using: :btree
    t.index ["roleid"], name: "mdl_roleassi_rol_ix", using: :btree
    t.index ["sortorder"], name: "mdl_roleassi_sor_ix", using: :btree
    t.index ["userid", "contextid", "roleid"], name: "mdl_roleassi_useconrol_ix", using: :btree
    t.index ["userid"], name: "mdl_roleassi_use_ix", using: :btree
  end

  create_table "mdl_role_capabilities", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "permission has to be signed, overriding a capability for a p" do |t|
    t.bigint "contextid",    default: 0,  null: false
    t.bigint "roleid",       default: 0,  null: false
    t.string "capability",   default: "", null: false
    t.bigint "permission",   default: 0,  null: false
    t.bigint "timemodified", default: 0,  null: false
    t.bigint "modifierid",   default: 0,  null: false
    t.index ["capability"], name: "mdl_rolecapa_cap_ix", using: :btree
    t.index ["contextid"], name: "mdl_rolecapa_con_ix", using: :btree
    t.index ["modifierid"], name: "mdl_rolecapa_mod_ix", using: :btree
    t.index ["roleid", "contextid", "capability"], name: "mdl_rolecapa_rolconcap_uix", unique: true, using: :btree
    t.index ["roleid"], name: "mdl_rolecapa_rol_ix", using: :btree
  end

  create_table "mdl_role_context_levels", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Lists which roles can be assigned at which context levels. T" do |t|
    t.bigint "roleid",       null: false
    t.bigint "contextlevel", null: false
    t.index ["contextlevel", "roleid"], name: "mdl_rolecontleve_conrol_uix", unique: true, using: :btree
    t.index ["roleid"], name: "mdl_rolecontleve_rol_ix", using: :btree
  end

  create_table "mdl_role_names", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "role names in native strings" do |t|
    t.bigint "roleid",    default: 0,  null: false
    t.bigint "contextid", default: 0,  null: false
    t.string "name",      default: "", null: false
    t.index ["contextid"], name: "mdl_rolename_con_ix", using: :btree
    t.index ["roleid", "contextid"], name: "mdl_rolename_rolcon_uix", unique: true, using: :btree
    t.index ["roleid"], name: "mdl_rolename_rol_ix", using: :btree
  end

  create_table "mdl_role_sortorder", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "sort order of course managers in a course" do |t|
    t.bigint "userid",    null: false
    t.bigint "roleid",    null: false
    t.bigint "contextid", null: false
    t.bigint "sortoder",  null: false
    t.index ["contextid"], name: "mdl_rolesort_con_ix", using: :btree
    t.index ["roleid"], name: "mdl_rolesort_rol_ix", using: :btree
    t.index ["userid", "roleid", "contextid"], name: "mdl_rolesort_userolcon_uix", unique: true, using: :btree
    t.index ["userid"], name: "mdl_rolesort_use_ix", using: :btree
  end

  create_table "mdl_scale", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Defines grading scales" do |t|
    t.bigint  "courseid",                             default: 0,  null: false
    t.bigint  "userid",                               default: 0,  null: false
    t.string  "name",                                 default: "", null: false
    t.text    "scale",             limit: 4294967295,              null: false
    t.text    "description",       limit: 4294967295,              null: false
    t.integer "descriptionformat", limit: 1,          default: 0,  null: false
    t.bigint  "timemodified",                         default: 0,  null: false
    t.index ["courseid"], name: "mdl_scal_cou_ix", using: :btree
  end

  create_table "mdl_scale_history", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "History table" do |t|
    t.bigint "action",                          default: 0,  null: false
    t.bigint "oldid",                                        null: false
    t.string "source"
    t.bigint "timemodified"
    t.bigint "loggeduser"
    t.bigint "courseid",                        default: 0,  null: false
    t.bigint "userid",                          default: 0,  null: false
    t.string "name",                            default: "", null: false
    t.text   "scale",        limit: 4294967295,              null: false
    t.text   "description",  limit: 4294967295,              null: false
    t.index ["action"], name: "mdl_scalhist_act_ix", using: :btree
    t.index ["courseid"], name: "mdl_scalhist_cou_ix", using: :btree
    t.index ["loggeduser"], name: "mdl_scalhist_log_ix", using: :btree
    t.index ["oldid"], name: "mdl_scalhist_old_ix", using: :btree
  end

  create_table "mdl_scorm", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "each table is one SCORM module and its configuration" do |t|
    t.bigint  "course",                                      default: 0,       null: false
    t.string  "name",                                        default: "",      null: false
    t.string  "scormtype",                limit: 50,         default: "local", null: false
    t.string  "reference",                                   default: "",      null: false
    t.text    "intro",                    limit: 4294967295,                   null: false
    t.integer "introformat",              limit: 2,          default: 0,       null: false
    t.string  "version",                  limit: 9,          default: "",      null: false
    t.float   "maxgrade",                 limit: 53,         default: 0.0,     null: false
    t.integer "grademethod",              limit: 1,          default: 0,       null: false
    t.bigint  "whatgrade",                                   default: 0,       null: false
    t.bigint  "maxattempt",                                  default: 1,       null: false
    t.boolean "forcecompleted",                              default: true,    null: false
    t.boolean "forcenewattempt",                             default: false,   null: false
    t.boolean "lastattemptlock",                             default: false,   null: false
    t.boolean "displayattemptstatus",                        default: true,    null: false
    t.boolean "displaycoursestructure",                      default: true,    null: false
    t.boolean "updatefreq",                                  default: false,   null: false
    t.string  "sha1hash",                 limit: 40
    t.string  "md5hash",                  limit: 32,         default: "",      null: false
    t.bigint  "revision",                                    default: 0,       null: false
    t.bigint  "launch",                                      default: 0,       null: false
    t.boolean "skipview",                                    default: true,    null: false
    t.boolean "hidebrowse",                                  default: false,   null: false
    t.boolean "hidetoc",                                     default: false,   null: false
    t.boolean "nav",                                         default: true,    null: false
    t.bigint  "navpositionleft",                             default: -100
    t.bigint  "navpositiontop",                              default: -100
    t.boolean "auto",                                        default: false,   null: false
    t.boolean "popup",                                       default: false,   null: false
    t.string  "options",                                     default: "",      null: false
    t.bigint  "width",                                       default: 100,     null: false
    t.bigint  "height",                                      default: 600,     null: false
    t.bigint  "timeopen",                                    default: 0,       null: false
    t.bigint  "timeclose",                                   default: 0,       null: false
    t.bigint  "timemodified",                                default: 0,       null: false
    t.boolean "completionstatusrequired"
    t.integer "completionscorerequired",  limit: 1
    t.integer "displayactivityname",      limit: 2,          default: 1,       null: false
    t.index ["course"], name: "mdl_scor_cou_ix", using: :btree
  end

  create_table "mdl_scorm_aicc_session", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Used by AICC HACP to store session information" do |t|
    t.bigint "userid",                  default: 0,  null: false
    t.bigint "scormid",                 default: 0,  null: false
    t.string "hacpsession",             default: "", null: false
    t.bigint "scoid",                   default: 0
    t.string "scormmode",    limit: 50
    t.string "scormstatus"
    t.bigint "attempt"
    t.string "lessonstatus"
    t.string "sessiontime"
    t.bigint "timecreated",             default: 0,  null: false
    t.bigint "timemodified",            default: 0,  null: false
    t.index ["scormid"], name: "mdl_scoraiccsess_sco_ix", using: :btree
    t.index ["userid"], name: "mdl_scoraiccsess_use_ix", using: :btree
  end

  create_table "mdl_scorm_scoes", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "each SCO part of the SCORM module" do |t|
    t.bigint "scorm",                           default: 0,  null: false
    t.string "manifest",                        default: "", null: false
    t.string "organization",                    default: "", null: false
    t.string "parent",                          default: "", null: false
    t.string "identifier",                      default: "", null: false
    t.text   "launch",       limit: 4294967295,              null: false
    t.string "scormtype",    limit: 5,          default: "", null: false
    t.string "title",                           default: "", null: false
    t.bigint "sortorder",                       default: 0,  null: false
    t.index ["scorm"], name: "mdl_scorscoe_sco_ix", using: :btree
  end

  create_table "mdl_scorm_scoes_data", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Contains variable data get from packages" do |t|
    t.bigint "scoid",                    default: 0,  null: false
    t.string "name",                     default: "", null: false
    t.text   "value", limit: 4294967295,              null: false
    t.index ["scoid"], name: "mdl_scorscoedata_sco_ix", using: :btree
  end

  create_table "mdl_scorm_scoes_track", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "to track SCOes" do |t|
    t.bigint "userid",                          default: 0,  null: false
    t.bigint "scormid",                         default: 0,  null: false
    t.bigint "scoid",                           default: 0,  null: false
    t.bigint "attempt",                         default: 1,  null: false
    t.string "element",                         default: "", null: false
    t.text   "value",        limit: 4294967295,              null: false
    t.bigint "timemodified",                    default: 0,  null: false
    t.index ["element"], name: "mdl_scorscoetrac_ele_ix", using: :btree
    t.index ["scoid"], name: "mdl_scorscoetrac_sco2_ix", using: :btree
    t.index ["scormid"], name: "mdl_scorscoetrac_sco_ix", using: :btree
    t.index ["userid", "scormid", "scoid", "attempt", "element"], name: "mdl_scorscoetrac_usescosco_uix", unique: true, using: :btree
    t.index ["userid"], name: "mdl_scorscoetrac_use_ix", using: :btree
  end

  create_table "mdl_scorm_seq_mapinfo", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "SCORM2004 objective mapinfo description" do |t|
    t.bigint  "scoid",                  default: 0,     null: false
    t.bigint  "objectiveid",            default: 0,     null: false
    t.bigint  "targetobjectiveid",      default: 0,     null: false
    t.boolean "readsatisfiedstatus",    default: true,  null: false
    t.boolean "readnormalizedmeasure",  default: true,  null: false
    t.boolean "writesatisfiedstatus",   default: false, null: false
    t.boolean "writenormalizedmeasure", default: false, null: false
    t.index ["objectiveid"], name: "mdl_scorseqmapi_obj_ix", using: :btree
    t.index ["scoid", "id", "objectiveid"], name: "mdl_scorseqmapi_scoidobj_uix", unique: true, using: :btree
    t.index ["scoid"], name: "mdl_scorseqmapi_sco_ix", using: :btree
  end

  create_table "mdl_scorm_seq_objective", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "SCORM2004 objective description" do |t|
    t.bigint  "scoid",                           default: 0,     null: false
    t.boolean "primaryobj",                      default: false, null: false
    t.string  "objectiveid",                     default: "",    null: false
    t.boolean "satisfiedbymeasure",              default: true,  null: false
    t.float   "minnormalizedmeasure", limit: 24, default: 0.0,   null: false
    t.index ["scoid", "id"], name: "mdl_scorseqobje_scoid_uix", unique: true, using: :btree
    t.index ["scoid"], name: "mdl_scorseqobje_sco_ix", using: :btree
  end

  create_table "mdl_scorm_seq_rolluprule", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "SCORM2004 sequencing rule" do |t|
    t.bigint "scoid",                           default: 0,     null: false
    t.string "childactivityset",     limit: 15, default: "",    null: false
    t.bigint "minimumcount",                    default: 0,     null: false
    t.float  "minimumpercent",       limit: 24, default: 0.0,   null: false
    t.string "conditioncombination", limit: 3,  default: "all", null: false
    t.string "action",               limit: 15, default: "",    null: false
    t.index ["scoid", "id"], name: "mdl_scorseqroll_scoid_uix", unique: true, using: :btree
    t.index ["scoid"], name: "mdl_scorseqroll_sco_ix", using: :btree
  end

  create_table "mdl_scorm_seq_rolluprulecond", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "SCORM2004 sequencing rule" do |t|
    t.bigint "scoid",                   default: 0,      null: false
    t.bigint "rollupruleid",            default: 0,      null: false
    t.string "operator",     limit: 5,  default: "noOp", null: false
    t.string "cond",         limit: 25, default: "",     null: false
    t.index ["rollupruleid"], name: "mdl_scorseqroll_rol_ix", using: :btree
    t.index ["scoid", "rollupruleid", "id"], name: "mdl_scorseqroll_scorolid_uix", unique: true, using: :btree
    t.index ["scoid"], name: "mdl_scorseqroll_sco2_ix", using: :btree
  end

  create_table "mdl_scorm_seq_rulecond", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "SCORM2004 rule condition" do |t|
    t.bigint "scoid",                         default: 0,        null: false
    t.bigint "ruleconditionsid",              default: 0,        null: false
    t.string "refrencedobjective",            default: "",       null: false
    t.float  "measurethreshold",   limit: 24, default: 0.0,      null: false
    t.string "operator",           limit: 5,  default: "noOp",   null: false
    t.string "cond",               limit: 30, default: "always", null: false
    t.index ["id", "scoid", "ruleconditionsid"], name: "mdl_scorseqrule_idscorul_uix", unique: true, using: :btree
    t.index ["ruleconditionsid"], name: "mdl_scorseqrule_rul_ix", using: :btree
    t.index ["scoid"], name: "mdl_scorseqrule_sco2_ix", using: :btree
  end

  create_table "mdl_scorm_seq_ruleconds", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "SCORM2004 rule conditions" do |t|
    t.bigint  "scoid",                           default: 0,     null: false
    t.string  "conditioncombination", limit: 3,  default: "all", null: false
    t.integer "ruletype",             limit: 1,  default: 0,     null: false
    t.string  "action",               limit: 25, default: "",    null: false
    t.index ["scoid", "id"], name: "mdl_scorseqrule_scoid_uix", unique: true, using: :btree
    t.index ["scoid"], name: "mdl_scorseqrule_sco_ix", using: :btree
  end

  create_table "mdl_sessions", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Database based session storage - now recommended" do |t|
    t.bigint "state",                           default: 0,  null: false
    t.string "sid",          limit: 128,        default: "", null: false
    t.bigint "userid",                                       null: false
    t.text   "sessdata",     limit: 4294967295
    t.bigint "timecreated",                                  null: false
    t.bigint "timemodified",                                 null: false
    t.string "firstip",      limit: 45
    t.string "lastip",       limit: 45
    t.index ["sid"], name: "mdl_sess_sid_uix", unique: true, using: :btree
    t.index ["state"], name: "mdl_sess_sta_ix", using: :btree
    t.index ["timecreated"], name: "mdl_sess_tim_ix", using: :btree
    t.index ["timemodified"], name: "mdl_sess_tim2_ix", using: :btree
    t.index ["userid"], name: "mdl_sess_use_ix", using: :btree
  end

  create_table "mdl_stats_daily", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "to accumulate daily stats" do |t|
    t.bigint "courseid",            default: 0,          null: false
    t.bigint "timeend",             default: 0,          null: false
    t.bigint "roleid",              default: 0,          null: false
    t.string "stattype", limit: 20, default: "activity", null: false
    t.bigint "stat1",               default: 0,          null: false
    t.bigint "stat2",               default: 0,          null: false
    t.index ["courseid"], name: "mdl_statdail_cou_ix", using: :btree
    t.index ["roleid"], name: "mdl_statdail_rol_ix", using: :btree
    t.index ["timeend"], name: "mdl_statdail_tim_ix", using: :btree
  end

  create_table "mdl_stats_monthly", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "To accumulate monthly stats" do |t|
    t.bigint "courseid",            default: 0,          null: false
    t.bigint "timeend",             default: 0,          null: false
    t.bigint "roleid",              default: 0,          null: false
    t.string "stattype", limit: 20, default: "activity", null: false
    t.bigint "stat1",               default: 0,          null: false
    t.bigint "stat2",               default: 0,          null: false
    t.index ["courseid"], name: "mdl_statmont_cou_ix", using: :btree
    t.index ["roleid"], name: "mdl_statmont_rol_ix", using: :btree
    t.index ["timeend"], name: "mdl_statmont_tim_ix", using: :btree
  end

  create_table "mdl_stats_user_daily", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "To accumulate daily stats per course/user" do |t|
    t.bigint "courseid",               default: 0,  null: false
    t.bigint "userid",                 default: 0,  null: false
    t.bigint "roleid",                 default: 0,  null: false
    t.bigint "timeend",                default: 0,  null: false
    t.bigint "statsreads",             default: 0,  null: false
    t.bigint "statswrites",            default: 0,  null: false
    t.string "stattype",    limit: 30, default: "", null: false
    t.index ["courseid"], name: "mdl_statuserdail_cou_ix", using: :btree
    t.index ["roleid"], name: "mdl_statuserdail_rol_ix", using: :btree
    t.index ["timeend"], name: "mdl_statuserdail_tim_ix", using: :btree
    t.index ["userid"], name: "mdl_statuserdail_use_ix", using: :btree
  end

  create_table "mdl_stats_user_monthly", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "To accumulate monthly stats per course/user" do |t|
    t.bigint "courseid",               default: 0,  null: false
    t.bigint "userid",                 default: 0,  null: false
    t.bigint "roleid",                 default: 0,  null: false
    t.bigint "timeend",                default: 0,  null: false
    t.bigint "statsreads",             default: 0,  null: false
    t.bigint "statswrites",            default: 0,  null: false
    t.string "stattype",    limit: 30, default: "", null: false
    t.index ["courseid"], name: "mdl_statusermont_cou_ix", using: :btree
    t.index ["roleid"], name: "mdl_statusermont_rol_ix", using: :btree
    t.index ["timeend"], name: "mdl_statusermont_tim_ix", using: :btree
    t.index ["userid"], name: "mdl_statusermont_use_ix", using: :btree
  end

  create_table "mdl_stats_user_weekly", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "To accumulate weekly stats per course/user" do |t|
    t.bigint "courseid",               default: 0,  null: false
    t.bigint "userid",                 default: 0,  null: false
    t.bigint "roleid",                 default: 0,  null: false
    t.bigint "timeend",                default: 0,  null: false
    t.bigint "statsreads",             default: 0,  null: false
    t.bigint "statswrites",            default: 0,  null: false
    t.string "stattype",    limit: 30, default: "", null: false
    t.index ["courseid"], name: "mdl_statuserweek_cou_ix", using: :btree
    t.index ["roleid"], name: "mdl_statuserweek_rol_ix", using: :btree
    t.index ["timeend"], name: "mdl_statuserweek_tim_ix", using: :btree
    t.index ["userid"], name: "mdl_statuserweek_use_ix", using: :btree
  end

  create_table "mdl_stats_weekly", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "To accumulate weekly stats" do |t|
    t.bigint "courseid",            default: 0,          null: false
    t.bigint "timeend",             default: 0,          null: false
    t.bigint "roleid",              default: 0,          null: false
    t.string "stattype", limit: 20, default: "activity", null: false
    t.bigint "stat1",               default: 0,          null: false
    t.bigint "stat2",               default: 0,          null: false
    t.index ["courseid"], name: "mdl_statweek_cou_ix", using: :btree
    t.index ["roleid"], name: "mdl_statweek_rol_ix", using: :btree
    t.index ["timeend"], name: "mdl_statweek_tim_ix", using: :btree
  end

  create_table "mdl_survey", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Each record is one SURVEY module with its configuration" do |t|
    t.bigint  "course",                          default: 0,  null: false
    t.bigint  "template",                        default: 0,  null: false
    t.integer "days",         limit: 3,          default: 0,  null: false
    t.bigint  "timecreated",                     default: 0,  null: false
    t.bigint  "timemodified",                    default: 0,  null: false
    t.string  "name",                            default: "", null: false
    t.text    "intro",        limit: 4294967295,              null: false
    t.integer "introformat",  limit: 2,          default: 0,  null: false
    t.string  "questions",                       default: "", null: false
    t.index ["course"], name: "mdl_surv_cou_ix", using: :btree
  end

  create_table "mdl_survey_analysis", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "text about each survey submission" do |t|
    t.bigint "survey",                    default: 0, null: false
    t.bigint "userid",                    default: 0, null: false
    t.text   "notes",  limit: 4294967295,             null: false
    t.index ["survey"], name: "mdl_survanal_sur_ix", using: :btree
    t.index ["userid"], name: "mdl_survanal_use_ix", using: :btree
  end

  create_table "mdl_survey_answers", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "the answers to each questions filled by the users" do |t|
    t.bigint "userid",                      default: 0, null: false
    t.bigint "survey",                      default: 0, null: false
    t.bigint "question",                    default: 0, null: false
    t.bigint "time",                        default: 0, null: false
    t.text   "answer1",  limit: 4294967295,             null: false
    t.text   "answer2",  limit: 4294967295,             null: false
    t.index ["question"], name: "mdl_survansw_que_ix", using: :btree
    t.index ["survey"], name: "mdl_survansw_sur_ix", using: :btree
    t.index ["userid"], name: "mdl_survansw_use_ix", using: :btree
  end

  create_table "mdl_survey_questions", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "the questions conforming one survey" do |t|
    t.string  "text",                         default: "", null: false
    t.string  "shorttext", limit: 30,         default: "", null: false
    t.string  "multi",     limit: 100,        default: "", null: false
    t.string  "intro",     limit: 50,         default: "", null: false
    t.integer "type",      limit: 2,          default: 0,  null: false
    t.text    "options",   limit: 4294967295
  end

  create_table "mdl_tag", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Tag table - this generic table will replace the old \"tags\" t" do |t|
    t.bigint  "userid",                                            null: false
    t.string  "name",                                 default: "", null: false
    t.string  "rawname",                              default: "", null: false
    t.string  "tagtype"
    t.text    "description",       limit: 4294967295
    t.integer "descriptionformat", limit: 1,          default: 0,  null: false
    t.integer "flag",              limit: 2,          default: 0
    t.bigint  "timemodified"
    t.index ["id", "name"], name: "mdl_tag_idnam_uix", unique: true, using: :btree
    t.index ["name"], name: "mdl_tag_nam_uix", unique: true, using: :btree
    t.index ["userid"], name: "mdl_tag_use_ix", using: :btree
  end

  create_table "mdl_tag_correlation", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "The rationale for the 'tag_correlation' table is performance" do |t|
    t.bigint "tagid",                             null: false
    t.text   "correlatedtags", limit: 4294967295, null: false
    t.index ["tagid"], name: "mdl_tagcorr_tag_ix", using: :btree
  end

  create_table "mdl_tag_instance", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "tag_instance table holds the information of associations bet" do |t|
    t.bigint "tagid",                                 null: false
    t.string "component",    limit: 100
    t.string "itemtype",                 default: "", null: false
    t.bigint "itemid",                                null: false
    t.bigint "contextid"
    t.bigint "tiuserid",                 default: 0,  null: false
    t.bigint "ordering"
    t.bigint "timecreated",              default: 0,  null: false
    t.bigint "timemodified",             default: 0,  null: false
    t.index ["contextid"], name: "mdl_taginst_con_ix", using: :btree
    t.index ["itemtype", "itemid", "tagid", "tiuserid"], name: "mdl_taginst_iteitetagtiu_uix", unique: true, using: :btree
    t.index ["tagid"], name: "mdl_taginst_tag_ix", using: :btree
  end

  create_table "mdl_task_adhoc", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "List of adhoc tasks waiting to run." do |t|
    t.string  "component",                      default: "", null: false
    t.string  "classname",                      default: "", null: false
    t.bigint  "nextruntime",                                 null: false
    t.bigint  "faildelay"
    t.text    "customdata",  limit: 4294967295
    t.integer "blocking",    limit: 1,          default: 0,  null: false
    t.index ["nextruntime"], name: "mdl_taskadho_nex_ix", using: :btree
  end

  create_table "mdl_task_scheduled", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "List of scheduled tasks to be run by cron." do |t|
    t.string  "component",              default: "",    null: false
    t.string  "classname",              default: "",    null: false
    t.bigint  "lastruntime"
    t.bigint  "nextruntime"
    t.integer "blocking",    limit: 1,  default: 0,     null: false
    t.string  "minute",      limit: 25, default: "",    null: false
    t.string  "hour",        limit: 25, default: "",    null: false
    t.string  "day",         limit: 25, default: "",    null: false
    t.string  "month",       limit: 25, default: "",    null: false
    t.string  "dayofweek",   limit: 25, default: "",    null: false
    t.bigint  "faildelay"
    t.integer "customised",  limit: 1,  default: 0,     null: false
    t.boolean "disabled",               default: false, null: false
    t.index ["classname"], name: "mdl_tasksche_cla_uix", unique: true, using: :btree
  end

  create_table "mdl_timezone", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Rules for calculating local wall clock time for users" do |t|
    t.string  "name",          limit: 100, default: "",      null: false
    t.bigint  "year",                      default: 0,       null: false
    t.string  "tzrule",        limit: 20,  default: "",      null: false
    t.bigint  "gmtoff",                    default: 0,       null: false
    t.bigint  "dstoff",                    default: 0,       null: false
    t.integer "dst_month",     limit: 1,   default: 0,       null: false
    t.integer "dst_startday",  limit: 2,   default: 0,       null: false
    t.integer "dst_weekday",   limit: 2,   default: 0,       null: false
    t.integer "dst_skipweeks", limit: 2,   default: 0,       null: false
    t.string  "dst_time",      limit: 6,   default: "00:00", null: false
    t.integer "std_month",     limit: 1,   default: 0,       null: false
    t.integer "std_startday",  limit: 2,   default: 0,       null: false
    t.integer "std_weekday",   limit: 2,   default: 0,       null: false
    t.integer "std_skipweeks", limit: 2,   default: 0,       null: false
    t.string  "std_time",      limit: 6,   default: "00:00", null: false
  end

  create_table "mdl_tool_customlang", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Contains the working checkout of all strings and their custo" do |t|
    t.string  "lang",           limit: 20,         default: "", null: false
    t.bigint  "componentid",                                    null: false
    t.string  "stringid",                          default: "", null: false
    t.text    "original",       limit: 4294967295,              null: false
    t.text    "master",         limit: 4294967295
    t.text    "local",          limit: 4294967295
    t.bigint  "timemodified",                                   null: false
    t.bigint  "timecustomized"
    t.integer "outdated",       limit: 2,          default: 0
    t.integer "modified",       limit: 2,          default: 0
    t.index ["componentid"], name: "mdl_toolcust_com_ix", using: :btree
    t.index ["lang", "componentid", "stringid"], name: "mdl_toolcust_lancomstr_uix", unique: true, using: :btree
  end

  create_table "mdl_tool_customlang_components", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Contains the list of all installed plugins that provide thei" do |t|
    t.string "name",    default: "", null: false
    t.string "version"
  end

  create_table "mdl_upgrade_log", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Upgrade logging" do |t|
    t.bigint "type",                                          null: false
    t.string "plugin",        limit: 100
    t.string "version",       limit: 100
    t.string "targetversion", limit: 100
    t.string "info",                             default: "", null: false
    t.text   "details",       limit: 4294967295
    t.text   "backtrace",     limit: 4294967295
    t.bigint "userid",                                        null: false
    t.bigint "timemodified",                                  null: false
    t.index ["timemodified"], name: "mdl_upgrlog_tim_ix", using: :btree
    t.index ["type", "timemodified"], name: "mdl_upgrlog_typtim_ix", using: :btree
    t.index ["userid"], name: "mdl_upgrlog_use_ix", using: :btree
  end

  create_table "mdl_url", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "each record is one url resource" do |t|
    t.bigint  "course",                            default: 0,  null: false
    t.string  "name",                              default: "", null: false
    t.text    "intro",          limit: 4294967295
    t.integer "introformat",    limit: 2,          default: 0,  null: false
    t.text    "externalurl",    limit: 4294967295,              null: false
    t.integer "display",        limit: 2,          default: 0,  null: false
    t.text    "displayoptions", limit: 4294967295
    t.text    "parameters",     limit: 4294967295
    t.bigint  "timemodified",                      default: 0,  null: false
    t.index ["course"], name: "mdl_url_cou_ix", using: :btree
  end

  create_table "mdl_user", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "One record for each person" do |t|
    t.string  "auth",              limit: 20,         default: "manual",    null: false
    t.boolean "confirmed",                            default: false,       null: false
    t.boolean "policyagreed",                         default: false,       null: false
    t.boolean "deleted",                              default: false,       null: false
    t.boolean "suspended",                            default: false,       null: false
    t.bigint  "mnethostid",                           default: 0,           null: false
    t.string  "username",          limit: 100,        default: "",          null: false
    t.string  "password",                             default: "",          null: false
    t.string  "idnumber",                             default: "",          null: false
    t.string  "firstname",         limit: 100,        default: "",          null: false
    t.string  "lastname",          limit: 100,        default: "",          null: false
    t.string  "email",             limit: 100,        default: "",          null: false
    t.boolean "emailstop",                            default: false,       null: false
    t.string  "icq",               limit: 15,         default: "",          null: false
    t.string  "skype",             limit: 50,         default: "",          null: false
    t.string  "yahoo",             limit: 50,         default: "",          null: false
    t.string  "aim",               limit: 50,         default: "",          null: false
    t.string  "msn",               limit: 50,         default: "",          null: false
    t.string  "phone1",            limit: 20,         default: "",          null: false
    t.string  "phone2",            limit: 20,         default: "",          null: false
    t.string  "institution",                          default: "",          null: false
    t.string  "department",                           default: "",          null: false
    t.string  "address",                              default: "",          null: false
    t.string  "city",              limit: 120,        default: "",          null: false
    t.string  "country",           limit: 2,          default: "",          null: false
    t.string  "lang",              limit: 30,         default: "en",        null: false
    t.string  "calendartype",      limit: 30,         default: "gregorian", null: false
    t.string  "theme",             limit: 50,         default: "",          null: false
    t.string  "timezone",          limit: 100,        default: "99",        null: false
    t.bigint  "firstaccess",                          default: 0,           null: false
    t.bigint  "lastaccess",                           default: 0,           null: false
    t.bigint  "lastlogin",                            default: 0,           null: false
    t.bigint  "currentlogin",                         default: 0,           null: false
    t.string  "lastip",            limit: 45,         default: "",          null: false
    t.string  "secret",            limit: 15,         default: "",          null: false
    t.bigint  "picture",                              default: 0,           null: false
    t.string  "url",                                  default: "",          null: false
    t.text    "description",       limit: 4294967295
    t.integer "descriptionformat", limit: 1,          default: 1,           null: false
    t.boolean "mailformat",                           default: true,        null: false
    t.boolean "maildigest",                           default: false,       null: false
    t.integer "maildisplay",       limit: 1,          default: 2,           null: false
    t.boolean "autosubscribe",                        default: true,        null: false
    t.boolean "trackforums",                          default: false,       null: false
    t.bigint  "timecreated",                          default: 0,           null: false
    t.bigint  "timemodified",                         default: 0,           null: false
    t.bigint  "trustbitmask",                         default: 0,           null: false
    t.string  "imagealt"
    t.string  "lastnamephonetic"
    t.string  "firstnamephonetic"
    t.string  "middlename"
    t.string  "alternatename"
    t.index ["alternatename"], name: "mdl_user_alt_ix", using: :btree
    t.index ["auth"], name: "mdl_user_aut_ix", using: :btree
    t.index ["city"], name: "mdl_user_cit_ix", using: :btree
    t.index ["confirmed"], name: "mdl_user_con_ix", using: :btree
    t.index ["country"], name: "mdl_user_cou_ix", using: :btree
    t.index ["deleted"], name: "mdl_user_del_ix", using: :btree
    t.index ["email"], name: "mdl_user_ema_ix", using: :btree
    t.index ["firstname"], name: "mdl_user_fir_ix", using: :btree
    t.index ["firstnamephonetic"], name: "mdl_user_fir2_ix", using: :btree
    t.index ["idnumber"], name: "mdl_user_idn_ix", using: :btree
    t.index ["lastaccess"], name: "mdl_user_las2_ix", using: :btree
    t.index ["lastname"], name: "mdl_user_las_ix", using: :btree
    t.index ["lastnamephonetic"], name: "mdl_user_las3_ix", using: :btree
    t.index ["middlename"], name: "mdl_user_mid_ix", using: :btree
    t.index ["mnethostid", "username"], name: "mdl_user_mneuse_uix", unique: true, using: :btree
  end

  create_table "mdl_user_devices", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This table stores user's mobile devices information in order" do |t|
    t.bigint "userid",                   default: 0,  null: false
    t.string "appid",        limit: 128, default: "", null: false
    t.string "name",         limit: 32,  default: "", null: false
    t.string "model",        limit: 32,  default: "", null: false
    t.string "platform",     limit: 32,  default: "", null: false
    t.string "version",      limit: 32,  default: "", null: false
    t.string "pushid",                   default: "", null: false
    t.string "uuid",                     default: "", null: false
    t.bigint "timecreated",                           null: false
    t.bigint "timemodified",                          null: false
    t.index ["pushid", "userid"], name: "mdl_userdevi_pususe_uix", unique: true, using: :btree
    t.index ["userid"], name: "mdl_userdevi_use_ix", using: :btree
  end

  create_table "mdl_user_enrolments", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Users participating in courses (aka enrolled users) - everyb" do |t|
    t.bigint "status",       default: 0,          null: false
    t.bigint "enrolid",                           null: false
    t.bigint "userid",                            null: false
    t.bigint "timestart",    default: 0,          null: false
    t.bigint "timeend",      default: 2147483647, null: false
    t.bigint "modifierid",   default: 0,          null: false
    t.bigint "timecreated",  default: 0,          null: false
    t.bigint "timemodified", default: 0,          null: false
    t.index ["enrolid", "userid"], name: "mdl_userenro_enruse_uix", unique: true, using: :btree
    t.index ["enrolid"], name: "mdl_userenro_enr_ix", using: :btree
    t.index ["modifierid"], name: "mdl_userenro_mod_ix", using: :btree
    t.index ["userid"], name: "mdl_userenro_use_ix", using: :btree
  end

  create_table "mdl_user_info_category", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Customisable fields categories" do |t|
    t.string "name",      default: "", null: false
    t.bigint "sortorder", default: 0,  null: false
  end

  create_table "mdl_user_info_data", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Data for the customisable user fields" do |t|
    t.bigint  "userid",                        default: 0, null: false
    t.bigint  "fieldid",                       default: 0, null: false
    t.text    "data",       limit: 4294967295,             null: false
    t.integer "dataformat", limit: 1,          default: 0, null: false
    t.index ["userid", "fieldid"], name: "mdl_userinfodata_usefie_uix", unique: true, using: :btree
  end

  create_table "mdl_user_info_field", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Customisable user profile fields" do |t|
    t.string  "shortname",                            default: "shortname", null: false
    t.text    "name",              limit: 4294967295,                       null: false
    t.string  "datatype",                             default: "",          null: false
    t.text    "description",       limit: 4294967295
    t.integer "descriptionformat", limit: 1,          default: 0,           null: false
    t.bigint  "categoryid",                           default: 0,           null: false
    t.bigint  "sortorder",                            default: 0,           null: false
    t.integer "required",          limit: 1,          default: 0,           null: false
    t.integer "locked",            limit: 1,          default: 0,           null: false
    t.integer "visible",           limit: 2,          default: 0,           null: false
    t.integer "forceunique",       limit: 1,          default: 0,           null: false
    t.integer "signup",            limit: 1,          default: 0,           null: false
    t.text    "defaultdata",       limit: 4294967295
    t.integer "defaultdataformat", limit: 1,          default: 0,           null: false
    t.text    "param1",            limit: 4294967295
    t.text    "param2",            limit: 4294967295
    t.text    "param3",            limit: 4294967295
    t.text    "param4",            limit: 4294967295
    t.text    "param5",            limit: 4294967295
  end

  create_table "mdl_user_lastaccess", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "To keep track of course page access times, used in online pa" do |t|
    t.bigint "userid",     default: 0, null: false
    t.bigint "courseid",   default: 0, null: false
    t.bigint "timeaccess", default: 0, null: false
    t.index ["courseid"], name: "mdl_userlast_cou_ix", using: :btree
    t.index ["userid", "courseid"], name: "mdl_userlast_usecou_uix", unique: true, using: :btree
    t.index ["userid"], name: "mdl_userlast_use_ix", using: :btree
  end

  create_table "mdl_user_password_resets", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "table tracking password reset confirmation tokens" do |t|
    t.bigint "userid",                                  null: false
    t.bigint "timerequested",                           null: false
    t.bigint "timererequested",            default: 0,  null: false
    t.string "token",           limit: 32, default: "", null: false
    t.index ["userid"], name: "mdl_userpassrese_use_ix", using: :btree
  end

  create_table "mdl_user_preferences", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Allows modules to store arbitrary user preferences" do |t|
    t.bigint "userid",              default: 0,  null: false
    t.string "name",                default: "", null: false
    t.string "value",  limit: 1333, default: "", null: false
    t.index ["userid", "name"], name: "mdl_userpref_usenam_uix", unique: true, using: :btree
  end

  create_table "mdl_user_private_key", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "access keys used in cookieless scripts - rss, etc." do |t|
    t.string "script",        limit: 128, default: "", null: false
    t.string "value",         limit: 128, default: "", null: false
    t.bigint "userid",                                 null: false
    t.bigint "instance"
    t.string "iprestriction"
    t.bigint "validuntil"
    t.bigint "timecreated"
    t.index ["script", "value"], name: "mdl_userprivkey_scrval_ix", using: :btree
    t.index ["userid"], name: "mdl_userprivkey_use_ix", using: :btree
  end

  create_table "mdl_webdav_locks", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Resource locks for WebDAV users" do |t|
    t.string  "token",         default: "",    null: false
    t.string  "path",          default: "",    null: false
    t.bigint  "expiry",        default: 0,     null: false
    t.bigint  "userid",        default: 0,     null: false
    t.boolean "recursive",     default: false, null: false
    t.boolean "exclusivelock", default: false, null: false
    t.bigint  "created",       default: 0,     null: false
    t.bigint  "modified",      default: 0,     null: false
    t.string  "owner"
    t.index ["expiry"], name: "mdl_webdlock_exp_ix", using: :btree
    t.index ["path"], name: "mdl_webdlock_pat_ix", using: :btree
    t.index ["token"], name: "mdl_webdlock_tok_uix", unique: true, using: :btree
  end

  create_table "mdl_wiki", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores Wiki activity configuration" do |t|
    t.bigint  "course",                            default: 0,               null: false
    t.string  "name",                              default: "Wiki",          null: false
    t.text    "intro",          limit: 4294967295
    t.integer "introformat",    limit: 2,          default: 0,               null: false
    t.bigint  "timecreated",                       default: 0,               null: false
    t.bigint  "timemodified",                      default: 0,               null: false
    t.string  "firstpagetitle",                    default: "First Page",    null: false
    t.string  "wikimode",       limit: 20,         default: "collaborative", null: false
    t.string  "defaultformat",  limit: 20,         default: "creole",        null: false
    t.boolean "forceformat",                       default: true,            null: false
    t.bigint  "editbegin",                         default: 0,               null: false
    t.bigint  "editend",                           default: 0
    t.index ["course"], name: "mdl_wiki_cou_ix", using: :btree
  end

  create_table "mdl_wiki_links", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Page wiki links" do |t|
    t.bigint "subwikiid",     default: 0, null: false
    t.bigint "frompageid",    default: 0, null: false
    t.bigint "topageid",      default: 0, null: false
    t.string "tomissingpage"
    t.index ["frompageid"], name: "mdl_wikilink_fro_ix", using: :btree
    t.index ["subwikiid"], name: "mdl_wikilink_sub_ix", using: :btree
  end

  create_table "mdl_wiki_locks", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Manages page locks" do |t|
    t.bigint "pageid",      default: 0, null: false
    t.string "sectionname"
    t.bigint "userid",      default: 0, null: false
    t.bigint "lockedat",    default: 0, null: false
  end

  create_table "mdl_wiki_pages", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores wiki pages" do |t|
    t.bigint  "subwikiid",                        default: 0,       null: false
    t.string  "title",                            default: "title", null: false
    t.text    "cachedcontent", limit: 4294967295,                   null: false
    t.bigint  "timecreated",                      default: 0,       null: false
    t.bigint  "timemodified",                     default: 0,       null: false
    t.bigint  "timerendered",                     default: 0,       null: false
    t.bigint  "userid",                           default: 0,       null: false
    t.bigint  "pageviews",                        default: 0,       null: false
    t.boolean "readonly",                         default: false,   null: false
    t.index ["subwikiid", "title", "userid"], name: "mdl_wikipage_subtituse_uix", unique: true, using: :btree
    t.index ["subwikiid"], name: "mdl_wikipage_sub_ix", using: :btree
  end

  create_table "mdl_wiki_subwikis", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores subwiki instances" do |t|
    t.bigint "wikiid",  default: 0, null: false
    t.bigint "groupid", default: 0, null: false
    t.bigint "userid",  default: 0, null: false
    t.index ["wikiid", "groupid", "userid"], name: "mdl_wikisubw_wikgrouse_uix", unique: true, using: :btree
    t.index ["wikiid"], name: "mdl_wikisubw_wik_ix", using: :btree
  end

  create_table "mdl_wiki_synonyms", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores wiki pages synonyms" do |t|
    t.bigint "subwikiid",   default: 0,             null: false
    t.bigint "pageid",      default: 0,             null: false
    t.string "pagesynonym", default: "Pagesynonym", null: false
    t.index ["pageid", "pagesynonym"], name: "mdl_wikisyno_pagpag_uix", unique: true, using: :btree
  end

  create_table "mdl_wiki_versions", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores wiki page history" do |t|
    t.bigint  "pageid",                           default: 0,        null: false
    t.text    "content",       limit: 4294967295,                    null: false
    t.string  "contentformat", limit: 20,         default: "creole", null: false
    t.integer "version",       limit: 3,          default: 0,        null: false
    t.bigint  "timecreated",                      default: 0,        null: false
    t.bigint  "userid",                           default: 0,        null: false
    t.index ["pageid"], name: "mdl_wikivers_pag_ix", using: :btree
  end

  create_table "mdl_workshop", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This table keeps information about the module instances and " do |t|
    t.bigint  "course",                                                                               null: false
    t.string  "name",                                                                default: "",     null: false
    t.text    "intro",                   limit: 4294967295
    t.integer "introformat",             limit: 2,                                   default: 0,      null: false
    t.text    "instructauthors",         limit: 4294967295
    t.integer "instructauthorsformat",   limit: 2,                                   default: 0,      null: false
    t.text    "instructreviewers",       limit: 4294967295
    t.integer "instructreviewersformat", limit: 2,                                   default: 0,      null: false
    t.bigint  "timemodified",                                                                         null: false
    t.integer "phase",                   limit: 2,                                   default: 0
    t.integer "useexamples",             limit: 1,                                   default: 0
    t.integer "usepeerassessment",       limit: 1,                                   default: 0
    t.integer "useselfassessment",       limit: 1,                                   default: 0
    t.decimal "grade",                                      precision: 10, scale: 5, default: "80.0"
    t.decimal "gradinggrade",                               precision: 10, scale: 5, default: "20.0"
    t.string  "strategy",                limit: 30,                                  default: "",     null: false
    t.string  "evaluation",              limit: 30,                                  default: "",     null: false
    t.integer "gradedecimals",           limit: 2,                                   default: 0
    t.integer "nattachments",            limit: 2,                                   default: 0
    t.integer "latesubmissions",         limit: 1,                                   default: 0
    t.bigint  "maxbytes",                                                            default: 100000
    t.integer "examplesmode",            limit: 2,                                   default: 0
    t.bigint  "submissionstart",                                                     default: 0
    t.bigint  "submissionend",                                                       default: 0
    t.bigint  "assessmentstart",                                                     default: 0
    t.bigint  "assessmentend",                                                       default: 0
    t.integer "phaseswitchassessment",   limit: 1,                                   default: 0,      null: false
    t.text    "conclusion",              limit: 4294967295
    t.integer "conclusionformat",        limit: 2,                                   default: 1,      null: false
    t.integer "overallfeedbackmode",     limit: 2,                                   default: 1
    t.integer "overallfeedbackfiles",    limit: 2,                                   default: 0
    t.bigint  "overallfeedbackmaxbytes",                                             default: 100000
    t.index ["course"], name: "mdl_work_cou_ix", using: :btree
  end

  create_table "mdl_workshop_aggregations", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Aggregated grades for assessment are stored here. The aggreg" do |t|
    t.bigint  "workshopid",                            null: false
    t.bigint  "userid",                                null: false
    t.decimal "gradinggrade", precision: 10, scale: 5
    t.bigint  "timegraded"
    t.index ["userid"], name: "mdl_workaggr_use_ix", using: :btree
    t.index ["workshopid", "userid"], name: "mdl_workaggr_woruse_uix", unique: true, using: :btree
    t.index ["workshopid"], name: "mdl_workaggr_wor_ix", using: :btree
  end

  create_table "mdl_workshop_assessments", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Info about the made assessment and automatically calculated " do |t|
    t.bigint  "submissionid",                                                                     null: false
    t.bigint  "reviewerid",                                                                       null: false
    t.bigint  "weight",                                                               default: 1, null: false
    t.bigint  "timecreated",                                                          default: 0
    t.bigint  "timemodified",                                                         default: 0
    t.decimal "grade",                                       precision: 10, scale: 5
    t.decimal "gradinggrade",                                precision: 10, scale: 5
    t.decimal "gradinggradeover",                            precision: 10, scale: 5
    t.bigint  "gradinggradeoverby"
    t.text    "feedbackauthor",           limit: 4294967295
    t.integer "feedbackauthorformat",     limit: 2,                                   default: 0
    t.integer "feedbackauthorattachment", limit: 2,                                   default: 0
    t.text    "feedbackreviewer",         limit: 4294967295
    t.integer "feedbackreviewerformat",   limit: 2,                                   default: 0
    t.index ["gradinggradeoverby"], name: "mdl_workasse_gra_ix", using: :btree
    t.index ["reviewerid"], name: "mdl_workasse_rev_ix", using: :btree
    t.index ["submissionid"], name: "mdl_workasse_sub_ix", using: :btree
  end

  create_table "mdl_workshop_assessments_old", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Legacy workshop_assessments table to be dropped later in Moo" do |t|
    t.bigint  "workshopid",                        default: 0,   null: false
    t.bigint  "submissionid",                      default: 0,   null: false
    t.bigint  "userid",                            default: 0,   null: false
    t.bigint  "timecreated",                       default: 0,   null: false
    t.bigint  "timegraded",                        default: 0,   null: false
    t.bigint  "timeagreed",                        default: 0,   null: false
    t.float   "grade",          limit: 53,         default: 0.0, null: false
    t.integer "gradinggrade",   limit: 2,          default: 0,   null: false
    t.integer "teachergraded",  limit: 2,          default: 0,   null: false
    t.integer "mailed",         limit: 2,          default: 0,   null: false
    t.integer "resubmission",   limit: 2,          default: 0,   null: false
    t.integer "donotuse",       limit: 2,          default: 0,   null: false
    t.text    "generalcomment", limit: 4294967295
    t.text    "teachercomment", limit: 4294967295
    t.string  "newplugin",      limit: 28
    t.bigint  "newid"
    t.index ["mailed"], name: "mdl_workasseold_mai_ix", using: :btree
    t.index ["submissionid"], name: "mdl_workasseold_sub_ix", using: :btree
    t.index ["userid"], name: "mdl_workasseold_use_ix", using: :btree
    t.index ["workshopid"], name: "mdl_workasseold_wor_ix", using: :btree
  end

  create_table "mdl_workshop_comments_old", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Legacy workshop_comments table to be dropped later in Moodle" do |t|
    t.bigint  "workshopid",                      default: 0, null: false
    t.bigint  "assessmentid",                    default: 0, null: false
    t.bigint  "userid",                          default: 0, null: false
    t.bigint  "timecreated",                     default: 0, null: false
    t.integer "mailed",       limit: 1,          default: 0, null: false
    t.text    "comments",     limit: 4294967295,             null: false
    t.string  "newplugin",    limit: 28
    t.bigint  "newid"
    t.index ["assessmentid"], name: "mdl_workcommold_ass_ix", using: :btree
    t.index ["mailed"], name: "mdl_workcommold_mai_ix", using: :btree
    t.index ["userid"], name: "mdl_workcommold_use_ix", using: :btree
    t.index ["workshopid"], name: "mdl_workcommold_wor_ix", using: :btree
  end

  create_table "mdl_workshop_elements_old", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Legacy workshop_elements table to be dropped later in Moodle" do |t|
    t.bigint  "workshopid",                          default: 0,   null: false
    t.integer "elementno",        limit: 2,          default: 0,   null: false
    t.text    "description",      limit: 4294967295,               null: false
    t.integer "scale",            limit: 2,          default: 0,   null: false
    t.integer "maxscore",         limit: 2,          default: 1,   null: false
    t.integer "weight",           limit: 2,          default: 11,  null: false
    t.float   "stddev",           limit: 53,         default: 0.0, null: false
    t.bigint  "totalassessments",                    default: 0,   null: false
    t.string  "newplugin",        limit: 28
    t.bigint  "newid"
    t.index ["workshopid"], name: "mdl_workelemold_wor_ix", using: :btree
  end

  create_table "mdl_workshop_grades", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "How the reviewers filled-up the grading forms, given grades " do |t|
    t.bigint  "assessmentid",                                                               null: false
    t.string  "strategy",          limit: 30,                                  default: "", null: false
    t.bigint  "dimensionid",                                                                null: false
    t.decimal "grade",                                precision: 10, scale: 5,              null: false
    t.text    "peercomment",       limit: 4294967295
    t.integer "peercommentformat", limit: 2,                                   default: 0
    t.index ["assessmentid", "strategy", "dimensionid"], name: "mdl_workgrad_assstrdim_uix", unique: true, using: :btree
    t.index ["assessmentid"], name: "mdl_workgrad_ass_ix", using: :btree
  end

  create_table "mdl_workshop_grades_old", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Legacy workshop_grades table to be dropped later in Moodle 2" do |t|
    t.bigint  "workshopid",                      default: 0, null: false
    t.bigint  "assessmentid",                    default: 0, null: false
    t.bigint  "elementno",                       default: 0, null: false
    t.text    "feedback",     limit: 4294967295,             null: false
    t.integer "grade",        limit: 2,          default: 0, null: false
    t.string  "newplugin",    limit: 28
    t.bigint  "newid"
    t.index ["assessmentid"], name: "mdl_workgradold_ass_ix", using: :btree
    t.index ["workshopid"], name: "mdl_workgradold_wor_ix", using: :btree
  end

  create_table "mdl_workshop_old", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Legacy workshop table to be dropped later in Moodle 2.x" do |t|
    t.bigint  "course",                              default: 0,      null: false
    t.string  "name",                                default: "",     null: false
    t.text    "description",      limit: 4294967295,                  null: false
    t.integer "wtype",            limit: 2,          default: 0,      null: false
    t.integer "nelements",        limit: 2,          default: 1,      null: false
    t.integer "nattachments",     limit: 2,          default: 0,      null: false
    t.integer "phase",            limit: 1,          default: 0,      null: false
    t.integer "format",           limit: 1,          default: 0,      null: false
    t.integer "gradingstrategy",  limit: 1,          default: 1,      null: false
    t.integer "resubmit",         limit: 1,          default: 0,      null: false
    t.integer "agreeassessments", limit: 1,          default: 0,      null: false
    t.integer "hidegrades",       limit: 1,          default: 0,      null: false
    t.integer "anonymous",        limit: 1,          default: 0,      null: false
    t.integer "includeself",      limit: 1,          default: 0,      null: false
    t.bigint  "maxbytes",                            default: 100000, null: false
    t.bigint  "submissionstart",                     default: 0,      null: false
    t.bigint  "assessmentstart",                     default: 0,      null: false
    t.bigint  "submissionend",                       default: 0,      null: false
    t.bigint  "assessmentend",                       default: 0,      null: false
    t.bigint  "releasegrades",                       default: 0,      null: false
    t.integer "grade",            limit: 2,          default: 0,      null: false
    t.integer "gradinggrade",     limit: 2,          default: 0,      null: false
    t.integer "ntassessments",    limit: 2,          default: 0,      null: false
    t.integer "assessmentcomps",  limit: 2,          default: 2,      null: false
    t.integer "nsassessments",    limit: 2,          default: 0,      null: false
    t.integer "overallocation",   limit: 2,          default: 0,      null: false
    t.bigint  "timemodified",                        default: 0,      null: false
    t.integer "teacherweight",    limit: 2,          default: 1,      null: false
    t.integer "showleaguetable",  limit: 2,          default: 0,      null: false
    t.integer "usepassword",      limit: 2,          default: 0,      null: false
    t.string  "password",         limit: 32,         default: "",     null: false
    t.string  "newplugin",        limit: 28
    t.bigint  "newid"
    t.index ["course"], name: "mdl_workold_cou_ix", using: :btree
  end

  create_table "mdl_workshop_rubrics_old", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Legacy workshop_rubrics table to be dropped later in Moodle " do |t|
    t.bigint  "workshopid",                     default: 0, null: false
    t.bigint  "elementno",                      default: 0, null: false
    t.integer "rubricno",    limit: 2,          default: 0, null: false
    t.text    "description", limit: 4294967295,             null: false
    t.string  "newplugin",   limit: 28
    t.bigint  "newid"
    t.index ["workshopid"], name: "mdl_workrubrold_wor_ix", using: :btree
  end

  create_table "mdl_workshop_stockcomments_old", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Legacy workshop_stockcomments table to be dropped later in M" do |t|
    t.bigint "workshopid",                    default: 0, null: false
    t.bigint "elementno",                     default: 0, null: false
    t.text   "comments",   limit: 4294967295,             null: false
    t.string "newplugin",  limit: 28
    t.bigint "newid"
    t.index ["workshopid"], name: "mdl_workstocold_wor_ix", using: :btree
  end

  create_table "mdl_workshop_submissions", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Info about the submission and the aggregation of the grade f" do |t|
    t.bigint  "workshopid",                                                                    null: false
    t.integer "example",              limit: 1,                                   default: 0
    t.bigint  "authorid",                                                                      null: false
    t.bigint  "timecreated",                                                                   null: false
    t.bigint  "timemodified",                                                                  null: false
    t.string  "title",                                                            default: "", null: false
    t.text    "content",              limit: 4294967295
    t.integer "contentformat",        limit: 2,                                   default: 0,  null: false
    t.integer "contenttrust",         limit: 2,                                   default: 0,  null: false
    t.integer "attachment",           limit: 1,                                   default: 0
    t.decimal "grade",                                   precision: 10, scale: 5
    t.decimal "gradeover",                               precision: 10, scale: 5
    t.bigint  "gradeoverby"
    t.text    "feedbackauthor",       limit: 4294967295
    t.integer "feedbackauthorformat", limit: 2,                                   default: 0
    t.bigint  "timegraded"
    t.integer "published",            limit: 1,                                   default: 0
    t.integer "late",                 limit: 1,                                   default: 0,  null: false
    t.index ["authorid"], name: "mdl_worksubm_aut_ix", using: :btree
    t.index ["gradeoverby"], name: "mdl_worksubm_gra_ix", using: :btree
    t.index ["workshopid"], name: "mdl_worksubm_wor_ix", using: :btree
  end

  create_table "mdl_workshop_submissions_old", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Legacy workshop_submissions table to be dropped later in Moo" do |t|
    t.bigint  "workshopid",                      default: 0,  null: false
    t.bigint  "userid",                          default: 0,  null: false
    t.string  "title",        limit: 100,        default: "", null: false
    t.bigint  "timecreated",                     default: 0,  null: false
    t.integer "mailed",       limit: 1,          default: 0,  null: false
    t.text    "description",  limit: 4294967295,              null: false
    t.integer "gradinggrade", limit: 2,          default: 0,  null: false
    t.integer "finalgrade",   limit: 2,          default: 0,  null: false
    t.integer "late",         limit: 2,          default: 0,  null: false
    t.bigint  "nassessments",                    default: 0,  null: false
    t.string  "newplugin",    limit: 28
    t.bigint  "newid"
    t.index ["mailed"], name: "mdl_worksubmold_mai_ix", using: :btree
    t.index ["userid"], name: "mdl_worksubmold_use_ix", using: :btree
    t.index ["workshopid"], name: "mdl_worksubmold_wor_ix", using: :btree
  end

  create_table "mdl_workshopallocation_scheduled", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Stores the allocation settings for the scheduled allocator" do |t|
    t.bigint  "workshopid",                                   null: false
    t.integer "enabled",       limit: 1,          default: 0, null: false
    t.bigint  "submissionend",                                null: false
    t.bigint  "timeallocated"
    t.text    "settings",      limit: 4294967295
    t.bigint  "resultstatus"
    t.string  "resultmessage", limit: 1333
    t.text    "resultlog",     limit: 4294967295
    t.index ["workshopid"], name: "mdl_worksche_wor_uix", unique: true, using: :btree
  end

  create_table "mdl_workshopeval_best_settings", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Settings for the grading evaluation subplugin Comparison wit" do |t|
    t.bigint  "workshopid",                       null: false
    t.integer "comparison", limit: 2, default: 5
    t.index ["workshopid"], name: "mdl_workbestsett_wor_uix", unique: true, using: :btree
  end

  create_table "mdl_workshopform_accumulative", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "The assessment dimensions definitions of Accumulative gradin" do |t|
    t.bigint  "workshopid",                                       null: false
    t.bigint  "sort",                                 default: 0
    t.text    "description",       limit: 4294967295
    t.integer "descriptionformat", limit: 2,          default: 0
    t.bigint  "grade",                                            null: false
    t.integer "weight",            limit: 3,          default: 1
    t.index ["workshopid"], name: "mdl_workaccu_wor_ix", using: :btree
  end

  create_table "mdl_workshopform_comments", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "The assessment dimensions definitions of Comments strategy f" do |t|
    t.bigint  "workshopid",                                       null: false
    t.bigint  "sort",                                 default: 0
    t.text    "description",       limit: 4294967295
    t.integer "descriptionformat", limit: 2,          default: 0
    t.index ["workshopid"], name: "mdl_workcomm_wor_ix", using: :btree
  end

  create_table "mdl_workshopform_numerrors", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "The assessment dimensions definitions of Number of errors gr" do |t|
    t.bigint  "workshopid",                                       null: false
    t.bigint  "sort",                                 default: 0
    t.text    "description",       limit: 4294967295
    t.integer "descriptionformat", limit: 2,          default: 0
    t.bigint  "descriptiontrust"
    t.string  "grade0",            limit: 50
    t.string  "grade1",            limit: 50
    t.integer "weight",            limit: 3,          default: 1
    t.index ["workshopid"], name: "mdl_worknume_wor_ix", using: :btree
  end

  create_table "mdl_workshopform_numerrors_map", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "This maps the number of errors to a percentual grade for sub" do |t|
    t.bigint  "workshopid",                          null: false
    t.bigint  "nonegative",                          null: false
    t.decimal "grade",      precision: 10, scale: 5, null: false
    t.index ["workshopid", "nonegative"], name: "mdl_worknumemap_wornon_uix", unique: true, using: :btree
    t.index ["workshopid"], name: "mdl_worknumemap_wor_ix", using: :btree
  end

  create_table "mdl_workshopform_rubric", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "The assessment dimensions definitions of Rubric grading stra" do |t|
    t.bigint  "workshopid",                                       null: false
    t.bigint  "sort",                                 default: 0
    t.text    "description",       limit: 4294967295
    t.integer "descriptionformat", limit: 2,          default: 0
    t.index ["workshopid"], name: "mdl_workrubr_wor_ix", using: :btree
  end

  create_table "mdl_workshopform_rubric_config", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "Configuration table for the Rubric grading strategy" do |t|
    t.bigint "workshopid",                             null: false
    t.string "layout",     limit: 30, default: "list"
    t.index ["workshopid"], name: "mdl_workrubrconf_wor_uix", unique: true, using: :btree
  end

  create_table "mdl_workshopform_rubric_levels", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", comment: "The definition of rubric rating scales" do |t|
    t.bigint  "dimensionid",                                                              null: false
    t.decimal "grade",                               precision: 10, scale: 5,             null: false
    t.text    "definition",       limit: 4294967295
    t.integer "definitionformat", limit: 2,                                   default: 0
    t.index ["dimensionid"], name: "mdl_workrubrleve_dim_ix", using: :btree
  end

end
