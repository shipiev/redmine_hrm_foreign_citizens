# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

resources :hrm_foreign_citizens do
  resources :hrm_citizen_documents, shallow: true
end

resources :hrm_citizenships
resources :hrm_citizen_documents
resources :hrm_citizen_document_types