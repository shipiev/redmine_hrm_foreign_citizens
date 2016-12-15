class HrmCitizenDocumentTypeCustomField < CustomField
  delegate :type_name, to: :'self.class', prefix: false, allow_nil: true

  def self.type_name
    "custom_fields.#{name.underscore}.name"
  end
end
