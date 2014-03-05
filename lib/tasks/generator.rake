namespace :generator do
  desc "Generate positions and questions"
  task :positions_and_questions => :environment do
    position_count = ENV['position_count'] ? ENV['position_count'].to_i : 10
    question_count   = ENV['question_count'] ? ENV['question_count'].to_i : 10
    position_count.times do
      position = Position.create(name: Faker::Lorem.words(3).join(" "), description: Faker::Lorem.sentence(1))
      question_count.times do
        position.questions.create(title: Faker::Lorem.sentence(1))
      end
    end
    puts "Generated #{position_count} positions with #{question_count} questions each"
  end

end