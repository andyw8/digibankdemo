if Rails.env.development? || Rails.env.test?
  require "factory_girl"

  namespace :dev do
    desc "Seed data for development environment"
    task prime: "db:setup" do
      include FactoryGirl::Syntax::Methods

      puts "\n\n *** Creating User *** \n\n"

      users = [
        create(
          :user,
          email: "user@example.com",
          name: "Example User",
          password: "password"
        ),
        create(
          :user,
          email: "user2@example.com",
          name: "Example User 2",
          password: "password"
        )
      ]

      users.each do |user|
        puts "Created user #{user.email} / #{user.password} \n"
      end

      puts "\n\n *** Creating Account for user *** \n\n"

      users.each do |user|
        account = create :account, user: user
        puts "Created account for user #{user.name} / Balance: #{account.balance}\n"
      end
    end
  end
end
