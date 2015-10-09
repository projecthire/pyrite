class CandidateDesiredLocation < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :desired_location
end
