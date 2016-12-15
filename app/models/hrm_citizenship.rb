class HrmCitizenship < ActiveRecord::Base
  acts_as_positioned
  acts_as_attachable
  acts_as_customizable

  has_many :hrm_foreign_citizens

  serialize :required_documents

  attr_protected :created_by_id, :updated_by_id, :created_at, :updated_at

  before_destroy :check_integrity
  before_save    :check_default

  def self.default
    @@default ||= find_by(is_default: true)
  end

  def check_default
    if is_default? && is_default_changed?
      self.class.update_all(is_default: false)
    end
  end

  def objects_count
    hrm_foreign_citizens.count
  end

  def in_use?
    self.objects_count != 0
  end

  def check_integrity
    raise 'Cannot delete' if self.in_use?
  end
end
