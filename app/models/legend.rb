require_relative "./concerns/slugifiable.rb"
class Legend < ActiveRecord::Base
    belongs_to :users
    has_many :stats
    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods

    
end