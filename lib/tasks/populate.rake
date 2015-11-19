namespace :fake do
  desc "generating fake data"
  task :all_data => [:environment, :users, :clients, :projects, :tasks] do
  end

  desc "generating fake users"
  task :users => [:environment] do
    50.times do
      User.create(name: Faker::Name.name,
                  email: Faker::Internet.email,
                  activated_at: Time.now,
                  activated: true,
                  password: 'test123456',
                  password_confirmation: 'test123456')
    end
  end


  desc "generating fake clients"
  task :clients => [:environment] do
    50.times do
      Client.create(name: Faker::Company.name,
                    contact_name: Faker::Name.name,
                    phone: Faker::PhoneNumber.phone_number,
                    contact_email: Faker::Internet.email,
                    street: Faker::Address.street_address,
                    city: Faker::Address.city,
                    state: Faker::Address.state,
                    postal_code: Faker::Address.postcode)
    end
  end


  desc "generating fake projects"
  task :projects => [:environment, :clients] do
    client_ids = Client.all.collect { |c| c.id }
    100.times do
      Project.create(title: Faker::App.name,
                     description: Faker::Lorem.paragraph,
                     start_date: rand(1..20).days.ago,
                     end_date: rand(1..20).days.from_now,
                     client_id: client_ids.shuffle.first)
    end
  end

  desc "generating fake tasks"
  task :tasks => [:environment, :users, :projects] do
    project_ids = Project.all.collect { |p| p.id }

    100.times.each_with_index do |index|
      project = Project.find(project_ids[index])
      user_names = User.all.collect { |u| u.name }
      rand(1..20).times do
        Task.create(employee_name: user_names.shuffle.first,
                    time: rand(1..24),
                    date: Faker::Time.between(project.start_date, project.end_date, :all),
                    project: project,
                    description: Faker::Lorem.sentences )

      end
    end
  end
end
