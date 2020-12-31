require_relative "./concerns/slugifiable.rb"
class Legend < ActiveRecord::Base
    belongs_to :users
    has_many :stats

    enum name: [:Bloodhound, :Gibraltar, :Lifeline, :Pathfinder, :Wraith, :Bangalore, :Caustic, :Mirage, :Octane, :Wattson, :Crypto, :Revenant, :Loba, :Rampart, :Horizon]

    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods

    
end