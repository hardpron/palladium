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

  task :series => :environment do
    a1 = Product.create(name:"Product_series", status:"Status_series", version:"Version_series")
    a2 = Plan.create(name:"Plan_series", version:"Version_series")
    a1.plans << a2
    a3 = Run.create(name:"Plan_series", version:"Version_series")
    a2.runs << a3
    a4 = ResultSet.create(name:"Plan_series", version:"Version_series")
    a3.result_sets << a4
    a5 = Result.create(message:"Message_series", author:"Author_series")
    a4.results << a5
    a6 = Status.create(name: 'Failed', color: '#FFAAAA')
    a6.results << a5
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
