class TrEvent < ActiveRecord::Base

	has_many :functions
	
	def self.search(description, event, page) 
		description = "%" if description.to_s.eql?("")
		event = "%" if event.to_s.eql?("")	
		paginate :per_page => 30, :page => page,
			:conditions => ['(lower(description) like ? or lower(doc) like ? or lower(action) like ?) and lower(eventbegin) like ?', 
			"%#{description}%","%#{description}%","%#{description}%","%#{event}%"]
	end
end
