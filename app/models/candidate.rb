class Candidate < User
  has_one :linkedin_auth

  before_save :set_default_role

  def candidate?
    true
  end

  def employer?
    false
  end

  private
    def set_default_role
      self.role ||= Role.find_by_name('RegisteredCandidate')
    end
end
