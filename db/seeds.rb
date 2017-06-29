# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |topic|
   Topic.create!(
       title: "Topic #{topic}"
   ) 
end
10.times do |blog|
    Blog.create!(
        title: "My Blog Post #{blog}",
        body: "I have always been interested in how the world and the things within it work. This has driven me to learn as much as I can every day. This passion I have for learning has allowed me to create wonderful things and enjoy the process in creating these things. I work great with a team and tend to get things done quick because of these qualities. 
        I look forward to obtaining my masters in computer science and minor in mathematics The languages I develop in at my current job include PHP, HTML, CSS, Javascript, and Swift. Programming languages I have but do not use at my job include C++, C# and Java.",
        topic_id: Topic.last.id
    )
end

5.times do |skill| 
    Skill.create!(
        title: "Rails #{skill}",
        percent_utilized: 15
    )
end

puts "5 skills created"


8.times do |portfolio_item|
   Portfolio.create!(
      title: "Portfolio title: #{portfolio_item}",
      subtitle: "Ruby on Rails",
      body: "unce unce unce unce unce",
      main_image: "http://via.placeholder.com/650x450",
      thumb_image: "http://via.placeholder.com/350x150" 
      ) 
end
puts "8 portfolio items created"

8.times do |portfolio_item|
   Portfolio.create!(
      title: "Portfolio title: #{portfolio_item}",
      subtitle: "Angular",
      body: "tf???",
      main_image: "http://via.placeholder.com/650x450",
      thumb_image: "http://via.placeholder.com/350x150" 
      ) 
end
puts "8 portfolio angular items created"

3.times do |technology|
    Portfolio.last.technologies.create!(
        name: "Techonology #{technology}",
        portfolio_id: Portfolio.last.id
    )
end
puts "3 technologies created"