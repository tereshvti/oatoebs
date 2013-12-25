class Script < ActiveRecord::Base
	has_many :steps
	belongs_to :suite
end
