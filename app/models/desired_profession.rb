class DesiredProfession < ActiveRecord::Base
  has_many :candidate_desired_professions
  has_many :candidates, through: :candidate_desired_professions
end
