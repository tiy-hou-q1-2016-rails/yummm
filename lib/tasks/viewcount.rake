desc "Update the View Count"
task :view_count => :environment do
  # puts "Count of Recipes: #{Recipe.count}"

  while true do
    puts "Update recipe count"
    Recipe.all.each do |recipe|
      recipe.update view_count: (1..100).to_a.sample
    end

    sleep 1
  end

end
