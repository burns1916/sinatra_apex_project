class Stats < ActiveRecord::Base
    belongs_to :users
    has_many :legend_stats
    has_many :legends, through: :legend_stats
end