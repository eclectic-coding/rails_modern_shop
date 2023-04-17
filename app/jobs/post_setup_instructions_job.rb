class PostSetupInstructionsJob < ApplicationJob
  queue_as :default

  # rubocop:disable Rails/Output
  # rubocop:disable Style/RedundantStringEscape
  def perform
    puts "\n== Setup complete! 🎉  =="
    puts "\n👉  Run \"rails s\" to start the development server."
    puts "\n== You can login with the following account  =="
    puts "\n🔗  #{Rails.application.routes.url_helpers.new_user_session_url(host: "localhost", port: 3000)}"
    puts "\📧  Email: #{DatabaseSeederJob::DEFAULT_USER_EMAIL}"
    puts "\🔐  Password: #{DatabaseSeederJob::DEFAULT_USER_PASSWORD}"
    puts "\n"
  end
  # rubocop:enable Style/RedundantStringEscape
  # rubocop:enable Rails/Output
end
