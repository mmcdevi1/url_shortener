class Link < ActiveRecord::Base
	after_create :create_slug

	scope :top_100_clicks, -> { order('clicks desc').limit(100) }

	validates_presence_of :url

	private

	def create_slug
		self.slug = self.id.to_s(36)
		self.save
	end
end
