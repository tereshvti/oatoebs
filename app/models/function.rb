class Function < ActiveRecord::Base
has_many :arguments, dependent: :destroy
belongs_to :tr_operation
belongs_to :tr_event
belongs_to :xxt_bs_operation
belongs_to :xxt_bs_tr_actions_v
validates :name, presence: true

	def self.search(name, page)
		name = "%" if name.to_s.eql?("")	
		paginate :per_page => 30, :page => page,
			:conditions => ['lower(name) like ?', "%#{name.downcase}%"], :order => 'name'
	end
end
