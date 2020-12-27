class User < ActiveRecord::Base
    has_many :stats
    has_many :legends, through: :stats
    has_secure_password
    
end