class CreateLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :logs do |t|
      t.references :user, foreign_key: true
      t.string :content
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
