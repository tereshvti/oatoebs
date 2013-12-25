class XxtRdDocType < ActiveRecord::Base
    self.primary_key = 'code'
    belongs_to :xxt_rd_doc_group, :foreign_key => "group_document"
	
	def self.search(doc_group, doc_type, page)
		doc_group = '%' if doc_group.eql?("")
		doc_type = '%' if doc_type.eql?("")
		paginate :per_page => 30, :page => page,
			:conditions => ['group_document like ? and code like ?', "%#{doc_group}%", "%#{doc_type}%"], :order => 'group_document'
	end
end
