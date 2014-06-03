class Reservation < ActiveRecord::Base
	attr_accessible :number, :end, :start
	validates_presence_of :number, :end, :start

	validate :overlap_check

	scope :overlapping, lambda { |r| {
	    :conditions => [
	    	"id <> ifnull(?, 0) and number = ? and (TIMESTAMPDIFF(SECOND, start, ?) * TIMESTAMPDIFF(SECOND, ?, end)) >= 0", 
	    	r.id, r.number, r.end, r.start]
	}}

	def overlap_check
		errors.add(:overbooking, "The Table is Busy") if Reservation.overlapping(self).any?
	end  
end
