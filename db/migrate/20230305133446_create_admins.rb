class CreateAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :admins do |t|
      t.string :name
      t.string :title
      t.string :body
      t.timestamps
    end
  end
end
