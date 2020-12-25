class LegendStats < ActiveRecord::Base
    belongs_to :legends
    belongs_to :stats
end