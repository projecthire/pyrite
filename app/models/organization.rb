class Organization < ActiveRecord::Base
  has_many :employers
  belongs_to :role

  before_create :set_default_role

  private
    def set_default_role
      self.role ||= Role.find_by_name('PaidOrganization')
    end
end
