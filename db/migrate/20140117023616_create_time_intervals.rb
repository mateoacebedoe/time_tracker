class CreateTimeIntervals < ActiveRecord::Migration
  def change
    create_table :time_intervals do |t|
      t.string :name #example: "1 hr 20 mins"

      t.timestamps
    end
  end
end
