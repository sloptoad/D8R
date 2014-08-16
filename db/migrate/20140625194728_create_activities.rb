class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :description
      t.string :location
      t.string :img
      t.references :activity_type
    end
  end
end
