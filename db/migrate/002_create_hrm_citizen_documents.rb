class CreateHrmCitizenDocuments < ActiveRecord::Migration
  def change
    create_table :hrm_citizen_documents do |t|
      t.string  :name
      t.integer :is_last
      t.integer :hrm_citizen_document_type_id
      t.integer :hrm_foreign_citizen_id
      t.date :released_on
      t.date :expire_on
      t.integer :created_by_id
      t.integer :updated_by_id
      t.datetime :created_at
      t.datetime :updated_at
    end

    add_index :hrm_foreign_citizens, :hrm_citizen_document_type_id
    add_index :hrm_foreign_citizens, :hrm_foreign_citizen_id
    add_index :hrm_foreign_citizens, :created_by_id
    add_index :hrm_foreign_citizens, :updated_by_id
  end
end
