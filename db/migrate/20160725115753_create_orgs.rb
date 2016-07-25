class CreateOrgs < ActiveRecord::Migration
  def change
    create_table :orgs do |t|
      t.string :name
      t.string :subdomain

      t.timestamps null: false
    end
  end
end
