class User < ActiveRecord::Base
    has_many :legends
    has_many :stats, through: :legends
    has_secure_password
    
end