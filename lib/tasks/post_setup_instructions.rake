namespace :post_setup_instructions do
  desc "Prints instructions once set up is complete"
  task perform: :environment do
    PostSetupInstructionsJob.perform_now
  end
end
