class Link < ActiveRecord::Base
	after_create :create_slug

	private

	def create_slug
		self.slug = self.id.to_s(36)
		self.save
	end
end
