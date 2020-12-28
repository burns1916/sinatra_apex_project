require_relative "./concerns/slugifiable.rb"
class Legend < ActiveRecord::Base
    has_many :legend_stats
    has_many :stats, through: :legend_stats
    has_many :users, through: :stats
    
    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods
    
end