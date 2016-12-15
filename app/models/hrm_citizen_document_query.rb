class HrmCitizenDocumentQuery < Query
  acts_as_attachable
  acts_as_customizable

  belongs_to :hrm_citizen_document_type
  belongs_to :hrm_foreign_citizen
  has_one    :hrm_citizenship, through: :hrm_foreign_citizen

  before_save :check_last

  validates :expire_on, :name, presence: true

  private

  def check_last
    if realy_last?
      self.class.
          where.not(id: id).
          where(hrm_citizen_document_type_id: hrm_citizen_document_type).
          update_all(is_last: false)
    end
  end

  def realy_last?
    maximum_expire_on =
        self.class.
            where.not(id: id).
            where(hrm_citizen_document_type_id: hrm_citizen_document_type).
            maximum(:expire_on)

    expire_on && (maximum_expire_on < expire_on)
  end

end
