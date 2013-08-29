class Message < ActiveRecord::Base

	validates :title, :content, :read_at, :presence => true
	validates :title, 		:length => 	{ maximum: 20 }
	validates :content, 	:length => 	{ maximum: 500 }

	def has_been_read
		self.read_at eq nil?
	end

end
