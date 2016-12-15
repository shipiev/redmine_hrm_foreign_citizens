module RedmineHrmForeignCitizens::CustomFieldsHelperPatch
  extend ActiveSupport::Concern

  included do
    %w[HrmForeignCitizenCustomField
       HrmCitizenshipCustomField
       HrmCitizenDocumentCustomField
       HrmCitizenDocumentTypeCustomField].
        each do |name|
          CustomFieldsHelper::CUSTOM_FIELDS_TABS.push(
              name: name,
              label: name.constantize.type_name,
              partial: 'custom_fields/index'
          )
        end
  end
end
