if Rails.env.development? || Rails.env.test?
  require "factory_girl"

  namespace :dev do
    desc "Seed data for development environment"
    task prime: "db:setup" do
      include FactoryGirl::Syntax::Methods

      puts "\n\n *** Creating User *** \n\n"

      user = create(
        :user,
        email: "user@example.com",
        name: "Example User",
        password: "password"
      )

      puts "Created user #{user.email} / #{user.password} \n"

      puts "\n\n *** Creating Account for user *** \n\n"

      account = create :account, user: user

      puts "Created account for user #{user.name} / Balance: #{account.balance}\n"
    end
  end
end
