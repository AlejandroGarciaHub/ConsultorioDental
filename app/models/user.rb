class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :patients, :dependent => :destroy

	attr_accessor :login

	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,:authentication_keys => [:login]
	validates :username,
	  	:presence => true,
	  	:uniqueness => {
	    :case_sensitive => false 
	  	}

	validate :validate_username

  ATTR_NAMES = {:login => "usuario/email",:username=>"El usuario",:password=>"La contraseña"}
    def self.human_attribute_name(attr, options={})
     ATTR_NAMES[attr.to_sym] || super
    end



	def validate_username
	  	if User.where(email: username).exists?
    	errors.add(:username, :invalid)
  		end
	end



  	def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions.to_hash).first
      end
    end

end
