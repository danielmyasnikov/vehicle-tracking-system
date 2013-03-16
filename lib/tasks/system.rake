namespace :stats do 
  desc "Show the number of animals alive" 
  task :alive => :environment do |t, args| 
    kingdom = Kingdom.find_by_name args[:kingdom] 
    count = kingdom.animals.where('is_dead != ?', false).count 
    puts "#{count} alive animals in #{kingdom.name}" 
  end 
end