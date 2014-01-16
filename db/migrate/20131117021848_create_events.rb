class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|

      t.integer :time_interval #in minutes
      t.string :description
      t.belongs_to :category


      t.timestamps

    end
  end
end
