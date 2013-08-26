class User < ActiveRecord::Base

	attr_accessible :name, :surname, :username, :email, :password_digest

	include Gravtastic

	before_validation :prep_email

	validates :name, :surname, :username, :email, :password_digest, :presence => true

	validates :name, 			:length => 	{ minimum: 2, maximum: 40 }
	validates :surname, 		:length => 	{ minimum: 2, maximum: 40 }
	validates :username,		:length => 	{ minimum: 3, maximum: 18 }
	validates :password_digest,	:length => 	{ minimum: 6, maximum: 18 }

	validates :username, 	:uniqueness => true
	validates :email, 		:uniqueness => true, :format => { with: /^[\w.+-]+@([\w]+.)+\w+$/ }
	
	has_secure_password
	has_gravatar :secure => true, :filetype => :png, :size => 120

	def full_name
		name.downcase.capitalize + " " + surname.downcase.capitalize
	end

	def self.search(username)
		User.find_by_username(username)
	end

	private

	def prep_email
	    self.email = self.email.strip.downcase if self.email
	end

end
