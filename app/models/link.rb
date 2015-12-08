class Link < ActiveRecord::Base
	attr_accessor :type_of_link

	belongs_to :user
end
