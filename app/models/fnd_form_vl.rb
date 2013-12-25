class FndFormVl < ActiveRecord::Base
	
	def self.search(search, page)
		if search	
			paginate :per_page => 30, :page => page,
			:conditions => ['lower(user_form_name) like ?', "%#{search.downcase}%"], :order => 'user_form_name'
		else
			paginate :per_page => 30,:page => page
		end
	end
end
