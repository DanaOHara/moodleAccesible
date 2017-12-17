class MdlCourse < ApplicationRecord

    self.table_name = "mdl_course"
    belongs_to :mdl_context
end
