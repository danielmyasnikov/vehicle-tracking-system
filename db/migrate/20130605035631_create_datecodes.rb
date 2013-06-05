class CreateDatecodes < ActiveRecord::Migration
  def up
  end

  def down
  end
end
Report.all.each do |rep|
  rep.datecode = rep.created_at.strftime("%Y%m")
  puts "#{rep.datecode}"
  rep.save
end