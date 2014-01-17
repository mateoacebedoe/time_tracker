class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|

      t.belongs_to :time_interval #in minutes
      t.string :description
      t.belongs_to :category


      t.timestamps

    end
  end
end
