class MdlContext < ApplicationRecord
    self.table_name = "mdl_context"
     has_many :mdl_role_assignments
     has_many :mdl_courses 
end
