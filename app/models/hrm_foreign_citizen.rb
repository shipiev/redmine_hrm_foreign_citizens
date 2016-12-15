class HrmForeignCitizen < ActiveRecord::Base
  acts_as_attachable
  acts_as_customizable

  belongs_to :hrm_citizenship
  has_many :hrm_citizen_documents
end
