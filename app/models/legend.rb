class Legend < ActiveRecord::Base
    has_many :legend_stats
    has_many :stats, through: :legend_stats
    has_many :users, through: :stats
    
end