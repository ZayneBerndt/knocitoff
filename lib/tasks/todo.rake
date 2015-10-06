namespace :todo do
  desc "Deletes items older than seven days"
  task delete: :environment do
    Item.where("created_at <= ?", Time.now - 7.days).destroy_all
  end

  desc "TODO"
  task items: :environment do
  end

end
