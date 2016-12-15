class CreateHrmForeignCitizens < ActiveRecord::Migration
  def change
    create_table :hrm_foreign_citizens do |t|
      t.string :name
      t.boolean :is_active, default: true
      t.integer :hrm_citizenship_id
      t.integer :created_by_id
      t.integer :updated_by_id
      t.datetime :created_at
      t.datetime :updated_at
    end

    add_index :hrm_foreign_citizens, :hrm_citizenship_id
    add_index :hrm_foreign_citizens, :created_by_id
    add_index :hrm_foreign_citizens, :updated_by_id
  end
end
