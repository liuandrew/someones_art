module VotesHelper
	# creates a cookie for given request_id and value and associates a vote_id
	# if the vote is opposite of an already existing vote, it overwrites the previous cookie as well as doubles
	# another vote in the new direction so that the net effect is towards the intended direction
	# if no cookie to hold votes exist, it creates one
	def give_vote_cookie(request_id, value, vote_id) 
		vote_cookies = retrieve_vote_cookies
		if cookies[:request_id].nil? 
			cookies.permanent[:request_id] = "#{request_id}"
			cookies.permanent[:vote_values] = "#{value}"
			cookies.permanent[:vote_id] = "#{vote_id}"
		elsif position = vote_cookies[:request_id].index("#{request_id}")
			delete_vote_id = vote_cookies[:vote_id][position]
			vote_cookies[:request_id].delete_at(position)
			vote_cookies[:vote_values].delete_at(position)
			vote_cookies[:vote_id].delete_at(position)
			cookies.permanent[:request_id] = vote_cookies[:request_id].join(", ") + ", #{request_id}"
			cookies.permanent[:vote_values] = vote_cookies[:vote_values].join(", ") + ", #{value}"
			cookies.permanent[:vote_id] = vote_cookies[:vote_id].join(", ") + ", #{vote_id}"
			Vote.find(delete_vote_id).delete()
		else 
			cookies.permanent[:request_id] = cookies[:request_id] + ", #{request_id}"
			cookies.permanent[:vote_values] = cookies[:vote_values] + ", #{value}"
			cookies.permanent[:vote_id] = cookies[:vote_id] + ", #{vote_id}"
		end
	end

	# returns a hash of vote values of cookies in hash => array form, with symbols :request_id, :vote_values, :vote_id
	def retrieve_vote_cookies
		unless cookies[:request_id].nil?
			record = cookies[:request_id].split(", ")
			values = cookies[:vote_values].split(", ")
			ids = cookies[:vote_id].split(", ")
			votes_hash = {:request_id => record, :vote_values => values, :vote_id => ids}
			return votes_hash
		end
	end

	# used to determine what arrows should be highlighted based on cookies
	def vote_direction(request_id)
		vote_cookies = retrieve_vote_cookies
		unless vote_cookies.nil?
			if position = vote_cookies[:request_id].index(request_id.to_s)
				return {:direction => vote_cookies[:vote_values][position], :vote_id => vote_cookies[:vote_id][position] }
			end
		end
		return {}
	end

	# deletes a vote from cookies based on the vote_id
	def delete_vote_cookie(vote_id)
		vote_cookies = retrieve_vote_cookies
		unless cookies[:request_id].nil? 
			if position = vote_cookies[:vote_id].index("#{vote_id}")
				vote_cookies[:request_id].delete_at(position)
				vote_cookies[:vote_values].delete_at(position)
				vote_cookies[:vote_id].delete_at(position)
				cookies.permanent[:request_id] = vote_cookies[:request_id].join(", ")
				cookies.permanent[:vote_values] = vote_cookies[:vote_values].join(", ")
				cookies.permanent[:vote_id] = vote_cookies[:vote_id].join(", ")
			end
		end
	end
end