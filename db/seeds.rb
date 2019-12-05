Dir[File.join(Rails.root, 'db', 'seeds/categorize_product', '*.rb')].sort.each do |seed|
  load seed
end
