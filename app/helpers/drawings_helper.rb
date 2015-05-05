module DrawingsHelper
	CLOUDINARY_NAME = "brandonliu"
	def thumbnail(image_url)
		splitoff = "http://res.cloudinary.com/" + CLOUDINARY_NAME + "/image/upload"
		named_url = image_url.split(splitoff)[1]
		thumbnail_url = splitoff + "/t_thumb_large" + named_url
		return thumbnail_url
	end

	def lower_quality(image_url)
		splitoff = "http://res.cloudinary.com/" + CLOUDINARY_NAME + "/image/upload"
		named_url = image_url.split(splitoff)[1]
		thumbnail_url = splitoff + "/q_25" + named_url
		return thumbnail_url
	end
end
