include ActiveRecord::Tasks
namespace :generate_random_items do

  task :all => :environment do
    Rake::Task['generate_random_items:products'].invoke
    Rake::Task['generate_random_items:plans'].invoke
    Rake::Task['generate_random_items:runs'].invoke
    Rake::Task['generate_random_items:result_sets'].invoke
    Rake::Task['generate_random_items:results'].invoke
  end

  task :products => :environment do
    10.times do |i|
      Product.create(name:"Product#{i}", status:"Status#{i}", version:"Version#{i}")
    end
  end

  task :plans => :environment do
    Product.all.each do |product|
      2.times do |i|
        product.plans << Plan.create(name:"Plan#{i}", version:"Version#{i}")
      end
    end
  end

  task :runs => :environment do
    Plan.all.each do |plan|
      3.times do |i|
        plan.runs << Run.create(name:"Plan#{i}", version:"Version#{i}")
      end
    end
  end

   task :result_sets => :environment do
    Run.all.each do |run|
      5.times do |i|
        run.result_sets << ResultSet.create(name:"Plan#{i}", version:"Version#{i}")
      end
    end
   end

  task :results => :environment do
    ResultSet.all.each do |result_sets|
      2.times do |i|
        result_sets.results << Result.create(message:"Message#{i}", author:"Author#{i}")
        # if Status.find_by_main_status(true)
      end
    end
  end
end

namespace :delete_all do
  task :all => :environment do
    Product.delete_all
    Plan.delete_all
    Run.delete_all
    ResultSet.delete_all
    Result.delete_all
    Status.delete_all
  end
end
