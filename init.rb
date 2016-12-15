plugin_name = 'redmine_hrm_foreign_citizens'

Redmine::Plugin.register plugin_name.to_sym do
  name 'Redmine Hrm Foreign Citizens plugin'
  author 'Roman Shipiev'
  description 'for tracking non-overdue foreign citizen documents'
  version "#{plugin_name.camelize}::VERSION".constantize
  url "https://github.com/shipiev/#{plugin_name}"
  author_url 'http://roman.shipiev.pro'
end

Rails.configuration.to_prepare do
  require_dependency 'hrm_citizen_document_custom_field'
  require_dependency 'hrm_citizen_document_type_custom_field'
  require_dependency 'hrm_citizenship_custom_field'
  require_dependency 'hrm_foreign_citizen_custom_field'
  require_dependency 'custom_field'

  require_patch plugin_name, %w(custom_fields_helper)
end