class DesiredLocation < ActiveRecord::Base
  has_many :candidate_desired_locations
  has_many :candidates, through: :candidate_desired_locations
end
