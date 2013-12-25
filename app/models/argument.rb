class Argument < ActiveRecord::Base
  has_many :argument_instances
  belongs_to :function
  
end
