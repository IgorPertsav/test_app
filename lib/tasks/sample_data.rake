namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Igor Pertsav",
                         :email => "pertsavigorstray@gmail.com",
                         :password => "20323200",
                         :password_confirmation => "20323200")
    admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{rand(n * 1000)}@railstutorial.org"
      puts email
      password  = "password"
      User.create(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
    User.all(:limit => 6).each do |user|
                50.times do
                  user.microposts.create!(:content => Faker::Lorem.sentence(5))
                end
              end
  end
end
