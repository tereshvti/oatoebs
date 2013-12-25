class XxtRdDocGroup < ActiveRecord::Base
	self.primary_key = 'code'
	has_many :xxt_rd_doc_types
end
