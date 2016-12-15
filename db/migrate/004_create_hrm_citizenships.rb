class CreateHrmCitizenships < ActiveRecord::Migration
  def change
    create_table :hrm_citizenships do |t|
      t.string  :name
      t.text    :required_documents
      t.integer :position
      t.boolean :is_default
      t.boolean :is_active, default: true
      t.integer :created_by_id
      t.integer :updated_by_id
      t.datetime :created_at
      t.datetime :updated_at
    end

    add_index :hrm_foreign_citizens, :created_by_id
    add_index :hrm_foreign_citizens, :updated_by_id
  end
end
