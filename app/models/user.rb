require_relative "./concerns/slugifiable.rb"
class User < ActiveRecord::Base
    has_many :legends
    has_many :stats, through: :legends
    has_secure_password

    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods
    
end