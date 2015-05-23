module VotesHelper
	def give_vote_cookie(request_id, value) 
		if cookies[:vote_record].empty? 
			cookies.permanent[:vote_record] = "#{request_id}"
			cookies.permanent[:vote_values] = "#{value}"
		else 
			cookies.permanent[:vote_record] = cookies[:vote_record] + ", #{request_id}"
			cookies.permanent[:vote_values] = cookies[:vote_values] + ", #{value}"
		end
	end


end
