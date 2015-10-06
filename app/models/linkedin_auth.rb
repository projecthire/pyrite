class LinkedinAuth < ActiveRecord::Base
  belongs_to :candidate

  def self.from_omniauth(auth)
    where(linkedin_uid: auth.uid).first_or_create
  end
end
