# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120917101532) do

  create_table "addresses", :force => true do |t|
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "zipcode"
    t.string   "state_name"
    t.string   "title"
    t.string   "state"
    t.boolean  "past",       :default => false
    t.integer  "country_id"
    t.integer  "state_id"
    t.integer  "faculty_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "assets", :force => true do |t|
    t.integer  "exam_portion_id"
    t.integer  "lesson_plan_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "assignment_scores", :force => true do |t|
    t.integer  "score"
    t.integer  "student_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "assignments", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "max_score"
    t.integer  "syllabus_id"
    t.integer  "grading_method_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "attendances", :force => true do |t|
    t.string   "reason"
    t.text     "description"
    t.integer  "attendancable_id"
    t.string   "attendancable_type"
    t.integer  "student_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "campuses", :force => true do |t|
    t.string   "name"
    t.integer  "school_id"
    t.integer  "address_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "class_group_course_enrollments", :force => true do |t|
    t.integer  "class_group_id"
    t.integer  "course_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "class_group_course_enrollments", ["class_group_id"], :name => "index_class_group_course_enrollments_on_class_group_id"
  add_index "class_group_course_enrollments", ["course_id"], :name => "index_class_group_course_enrollments_on_course_id"

  create_table "class_group_enrollments", :force => true do |t|
    t.integer  "class_group_id"
    t.integer  "student_id"
    t.integer  "seat_number"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "class_group_enrollments", ["class_group_id"], :name => "index_class_group_enrollments_on_class_group_id"
  add_index "class_group_enrollments", ["student_id"], :name => "index_class_group_enrollments_on_student_id"

  create_table "class_groups", :force => true do |t|
    t.string   "name"
    t.integer  "grade"
    t.string   "homeroom"
    t.integer  "faculty_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contact_types", :force => true do |t|
    t.string "name"
  end

  create_table "contacts", :force => true do |t|
    t.string   "data"
    t.text     "details"
    t.boolean  "is_primary",      :default => false
    t.boolean  "is_emergency",    :default => false
    t.integer  "contact_type_id"
    t.integer  "student_id"
    t.integer  "guardian_id"
    t.integer  "faculty_id"
    t.integer  "campus_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "countries", :force => true do |t|
    t.string  "iso_name"
    t.string  "iso"
    t.string  "iso3"
    t.string  "name"
    t.integer "numcode"
  end

  create_table "course_enrollments", :force => true do |t|
    t.integer  "student_id"
    t.integer  "course_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "course_enrollments", ["course_id"], :name => "index_course_enrollments_on_course_id"
  add_index "course_enrollments", ["student_id"], :name => "index_course_enrollments_on_student_id"

  create_table "course_group_enrollments", :force => true do |t|
    t.integer "course_id"
    t.integer "course_group_id"
  end

  create_table "course_groups", :force => true do |t|
    t.string   "name"
    t.boolean  "is_deleted", :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "courses", :force => true do |t|
    t.string   "code"
    t.integer  "faculty_id"
    t.integer  "syllabus_id"
    t.integer  "class_group_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "exam_portion_scores", :force => true do |t|
    t.float    "score"
    t.integer  "exam_portion_id"
    t.integer  "student_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "exam_portions", :force => true do |t|
    t.string   "name"
    t.float    "max_score"
    t.float    "weight",            :default => 100.0
    t.integer  "problem_count"
    t.text     "description"
    t.text     "adjustments"
    t.boolean  "is_master",         :default => false
    t.integer  "exam_id"
    t.integer  "grading_method_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "exam_schedules", :force => true do |t|
    t.integer "exam_portion_id"
    t.integer "schedule_id"
    t.integer "course_id"
  end

  create_table "exam_scores", :force => true do |t|
    t.float    "score"
    t.text     "comment"
    t.integer  "exam_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "exam_syllabuses", :force => true do |t|
    t.integer  "exam_id"
    t.integer  "syllabus_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "exams", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "adjustments"
    t.float    "weight"
    t.boolean  "use_weighting",     :default => false
    t.boolean  "is_standalone",     :default => false
    t.integer  "grading_method_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "faculties", :force => true do |t|
    t.integer "user_id"
  end

  create_table "grading_methods", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "method"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "guardian_addresses", :force => true do |t|
    t.integer  "guardian_id"
    t.integer  "address_id"
    t.boolean  "is_primary",  :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "guardians", :force => true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "name_reading"
    t.string   "surname_reading"
    t.string   "relationship"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "guardians_students", :force => true do |t|
    t.integer "guardian_id"
    t.integer "student_id"
  end

  create_table "import_files", :force => true do |t|
    t.string   "context"
    t.string   "importer_type"
    t.string   "data_file_file_name"
    t.string   "data_file_content_type"
    t.integer  "data_file_file_size"
    t.datetime "data_file_updated_at"
  end

  create_table "installs", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "installs", ["email"], :name => "index_installs_on_email", :unique => true
  add_index "installs", ["reset_password_token"], :name => "index_installs_on_reset_password_token", :unique => true

  create_table "lesson_plans", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "syllabus_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "lessons", :force => true do |t|
    t.integer  "lesson_plan_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "notes", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "student_id"
    t.integer  "lesson_plan_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "presets", :force => true do |t|
    t.string   "name"
    t.string   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string  "name"
    t.integer "class_group_enrollment_id"
    t.integer "faculty_id"
  end

  create_table "schedules", :force => true do |t|
    t.datetime "starting"
    t.datetime "ending"
    t.string   "repeat"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "schools", :force => true do |t|
    t.string   "name"
    t.boolean  "is_primary",     :default => false
    t.text     "slogan"
    t.text     "description"
    t.date     "founded"
    t.string   "principal"
    t.string   "vice_principal"
    t.text     "grades"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "semesters", :force => true do |t|
    t.date     "starting"
    t.date     "ending"
    t.integer  "class_group_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "states", :force => true do |t|
    t.string  "name"
    t.string  "abbr"
    t.string  "name_ascii"
    t.integer "code"
    t.integer "country_numcode"
  end

  create_table "student_addresses", :force => true do |t|
    t.integer  "student_id"
    t.integer  "address_id"
    t.boolean  "is_primary", :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "students", :force => true do |t|
    t.string   "name"
    t.string   "middle_name"
    t.string   "surname"
    t.string   "name_reading",                 :default => ""
    t.string   "surname_reading",              :default => ""
    t.boolean  "gender"
    t.string   "phone"
    t.string   "email"
    t.date     "birth_date"
    t.date     "admitted"
    t.date     "graduated"
    t.string   "student_id_number"
    t.string   "student_foreign_id_number"
    t.string   "national_registration_number"
    t.integer  "user_id"
    t.integer  "faculty_id"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

  create_table "syllabuses", :force => true do |t|
    t.string   "name"
    t.string   "code"
    t.text     "description"
    t.integer  "credits"
    t.integer  "hours"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.boolean  "admin",                  :default => false
    t.text     "settings"
    t.string   "locale"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "email"
    t.string   "encrypted_password"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
