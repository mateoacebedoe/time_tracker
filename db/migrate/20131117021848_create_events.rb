class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|

      t.string :title
      t.integer :time_interval #in minutes

      t.timestamps
    end
  end
end
