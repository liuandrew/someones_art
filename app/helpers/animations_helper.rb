module AnimationsHelper
	def youtube_thumbnail_url(youtube_id)
		image_url = "http://img.youtube.com/vi/" + youtube_id + "/0.jpg"
		return image_url
	end

	def youtube_video_embed_url(youtube_id)
		youtube_url = "https://www.youtube.com/embed/" + youtube_id
		return youtube_url
	end
end
