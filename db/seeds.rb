for hr in 0..8
  for min in 0..5
    if hr == 0 and min != 0
      TimeInterval.create!(name: "#{min*10} mins")
    elsif hr == 1 and min == 0
      TimeInterval.create!(name: "#{hr} hour")
    elsif hr == 1
      TimeInterval.create!(name: "#{hr} hour #{min*10} mins")
    elsif min == 0 and hr != 0
      TimeInterval.create!(name: "#{hr} hours")
    elsif hr != 0
      TimeInterval.create!(name: "#{hr} hours #{min*10} mins")
    end
  end
end

Category.create(name: "Root", parent_id: 0) #category_id == 1
