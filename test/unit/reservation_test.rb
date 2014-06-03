require 'test_helper'

class ReservationTest < ActiveSupport::TestCase
  test "table cannot have 2 reservations for the same period of time" do

  	overlap_cases = [
  		{s: '2014-06-02 10:47:59', e: '2014-06-02 11:47:59'},
  		{s: '2014-06-02 10:40:59', e: '2014-06-02 11:40:59'},
  		{s: '2014-06-02 11:40:59', e: '2014-06-02 12:47:59'},
  		{s: '2014-06-02 10:00:59', e: '2014-06-02 12:00:59'},
  	]

  	overlap_cases.each do |overlap|
	  	r = Reservation.new(
	  		:number => 10, 
	  		:start => overlap[:s], 
	  		:end => overlap[:e],
	  	)

	    assert_equal false, r.valid?
  	end
  end
end
