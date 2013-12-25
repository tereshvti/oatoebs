class XxtBsOperation < ActiveRecord::Base
has_many :functions

	def self.search(doc_group,doc_type,user_operation_name,event,page)
		doc_group = "%" if doc_group.to_s.eql?("")
		doc_type = "%" if doc_type.to_s.eql?("")
		user_operation_name = "%" if user_operation_name.to_s.eql?("")
		event = "%" if event.to_s.eql?("")
		if !doc_type.to_s.eql?("%")
			doc_group=(XxtRdDocType.find_by code: doc_type).group_document
		end
		paginate :per_page => 30, :page => page,
			:conditions => ['lower(doc_group_code) like ? and lower(user_operation_name) like ? and (lower(techregl_code) like ? or lower(techregl_select) like ? )', 
			"%#{doc_group}%","%#{user_operation_name}%","%#{event}%","%#{event}%"]
	end

end
