Dir[File.join(Rails.root, 'db', 'seeds/main_seeds', '*.rb')].sort.each do |seed|
  load seed
end
