class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.tweet :belongs_to

      t.timestamps null: false
    end
  end
end
