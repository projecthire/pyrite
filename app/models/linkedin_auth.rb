class LinkedinAuth < ActiveRecord::Base
  def self.from_omniauth(auth)
    where(linkedin_uid: auth.uid).first_or_create
  end
end
