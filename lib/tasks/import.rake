namespace :group_shelf do
  desc "Import books from CSV"
  task :import => :merb_env do
    file = Merb.root / :data / 'books.csv'
    FasterCSV.foreach(file, { :headers => :first_row }) do |row|
      book = Book.create(:isbn => row['ISBN'])
      begin
        puts "Imported #{book.title}..."
      end
    end
  end
end