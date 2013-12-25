class ArgumentInstance < ActiveRecord::Base
  belongs_to :argument
  belongs_to :step
end
