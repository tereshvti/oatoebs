class Step < ActiveRecord::Base
  has_many :argument_instances
  belongs_to :function
  belongs_to :script
  validates_presence_of :function_id
end
