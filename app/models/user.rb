class User < ActiveRecord::Base

	attr_accessible :id, :name, :surname, :username, :email, 
					:created_at, :updated_at, :password_digest,
					:password, :password_confirmation

	include Gravtastic

	before_validation :capitalize_name, :capitalize_surname
	before_validation :prep_email

	validates :name, :surname, :username, :email, :presence => true
	validates :password, :presence => true, :on => :create

	validates :name, 					:length => 	{ minimum: 2, maximum: 20 }
	validates :surname, 				:length => 	{ minimum: 2, maximum: 20 }
	validates :username,				:length => 	{ minimum: 3, maximum: 18 }
	validates :password,				:length => 	{ minimum: 6, maximum: 18 }
	validates :password_confirmation,	:length => 	{ minimum: 6, maximum: 18 }

	validates :username, 	:uniqueness => true
	validates :email, 		:uniqueness => true, :format => { with: /^[\w.+-]+@([\w]+.)+\w+$/ }
	
	has_secure_password
	has_gravatar :secure => true, :filetype => :png, :size => 120

	def full_name
		name.downcase.capitalize + " " + surname.downcase.capitalize
	end

	def self.search(username)
		User.find_by_username(username) if username
	end

	private

	def capitalize_name
	    self.name = self.name.strip.downcase.capitalize if self.name
	end

	def capitalize_surname
	    self.surname = self.surname.strip.downcase.capitalize if self.surname
	end

	def prep_email
	    self.email = self.email.strip.downcase if self.email
	end

end
