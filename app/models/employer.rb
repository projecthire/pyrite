class Employer < User
  belongs_to :organization

  before_save :set_default_role

  def candidate?
    false
  end

  def employer?
    true
  end

  def owner?
    self.role.name == 'OrganizationOwner'
  end

  private
    def set_default_role
      self.role ||= Role.find_by_name('OrganizationMember')
    end
end
