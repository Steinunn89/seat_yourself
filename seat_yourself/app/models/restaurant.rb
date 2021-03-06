class Restaurant < ActiveRecord::Base
	has_many :reservations
	belongs_to :owners
	has_many :customers, through: :reservations

	def available?(reservation_time, party_size)
		# binding.pry
		reserved = reservations.where(:reservation_time => $OPENING_HOUR).sum(party_size)
		party_size <= (seats - reserved)
	end

	# def restaurant_open
	# 	opening_time = Time.new(hour: 10)

	# 	closing_time = Time.new(hour: 22)

	# 	if reservation.reservation_time < opening_time || reservation.reservation_time > closing_time
	# 		errors.add (:reservation_time, "Reservation cannot be made outside restaurant hours (10AM - 10PM Daily).")
	# 	end
  		
 #  	end

end
