class CreateOrganizations < ActiveRecord::Migration[6.1]
  def change
    create_table :organizations do |t|
      t.string :title
      t.string :description
      t.string :purpose
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
