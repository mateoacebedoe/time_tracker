class CreateLifePhases < ActiveRecord::Migration
  def change
    create_table :life_phases do |t|
      t.string :name
      t.date :date

      t.timestamps
    end
  end
end
