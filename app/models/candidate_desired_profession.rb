class CandidateDesiredProfession < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :desired_profession
end
