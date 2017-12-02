class MdlForum < ApplicationRecord

self.table_name = "mdl_forum"
self.inheritance_column = :_type_disabled
end
