class XxtBsTrActionsV < ActiveRecord::Base
has_many :functions

	def self.search(doc_group,doc_type,action_code,event,page)
		doc_group = "%" if doc_group.to_s.eql?("")
		doc_type = "%" if doc_type.to_s.eql?("")
		action_code = "%" if action_code.to_s.eql?("")
		event = "%" if event.to_s.eql?("")
		paginate :per_page => 30, :page => page,
			:conditions => ['lower(group_code) like ? and lower(doc_types) like ? and lower(action_code) like ? and (lower(tr_code) like ? or lower(techregl_select) like ? )', 
			"%#{doc_group}%","%#{doc_type}%","%#{action_code}%","%#{event}%","%#{event}%"]
	end

end
