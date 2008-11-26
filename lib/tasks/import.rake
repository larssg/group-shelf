namespace :group_shelf do
  desc "Import books from CSV"
  task :import => :merb_env do
    file = Merb.root / :data / 'books.csv'
    FasterCSV.foreach(file, { :headers => :first_row }) do |row|
      next if row['ISBN'].strip.blank?
      book = Book.create(:isbn => row['ISBN'])
      puts "Imported #{book.title}..."
    end
  end
end